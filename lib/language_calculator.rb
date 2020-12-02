class LanguageCalculator

  def initialize(response)
    @response = response
  end

  def call
    most_popular_language(results_hash @response)
  end

private

  def results_hash(response)
    return if response.nil?

    languages_hash = Hash.new(0) #must set default value
    repos = response.parsed_response #HTTParty method
    repos.map do |repo|
      unless repo["language"].nil?
        languages_hash[repo["language"]] += repo["size"]
      end
    end

   languages_hash
  end

  def most_popular_language(hash)
    return if hash.empty?

    hash.select { |language, size| size==hash.values.max }.keys
  end

end
