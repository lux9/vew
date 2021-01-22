def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  email.match?(/^([^@]+)@([^@]+)\.(\w+)$/)
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  emails.select { |email| valid?(email) }
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  emails.group_by { |email| email.match(/.(\w+)$/)[1] }
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  match_data = email.match(/^(?<name>\w+)@(?<domain>\w+).(?<tld>\w+)$/)
  return {
    username: match_data[:name],
    domain: match_data[:domain],
    tld: match_data[:tld]
  }
end


LOCALES = {
  en: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

# Translates a sentence:
# Picks the corresponding translation in LOCALES, given a keyword and a language:
# 1. Dive into the enclosed Hash correponding to the language (falls back to :en if not found)
# 2. In that language Hash, retrieve the value corresponding to the keyword
def translate(keyword, language)
  if LOCALES[language.to_sym].nil?
    translations = LOCALES[:en]
  else
    translations = LOCALES[language.to_sym]
  end
  return translations[keyword]
end

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD

  # Extract information from the email with capture groups
  match_data = email.match(/^(?<name>\w+)@(?<domain>\w+).(?<tld>\w+)$/)

  # Compose the returned hash
  return {
    username: match_data[:name],
    domain: match_data[:domain],
    tld: match_data[:tld],
    subject: translate(:subject, match_data[:tld]), # Use the translate method to pick information from LOCALES
    body: translate(:body, match_data[:tld]),
    closing: translate(:closing, match_data[:tld]),
    signature: translate(:signature, match_data[:tld])
  }
end
