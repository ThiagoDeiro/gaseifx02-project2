class ImdbService

    def get_title(title)
        response = HTTP.get("https://www.omdbapi.com/?apikey=f44e65cd&t=#{title}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Title"]
    end 

    def get_plot_by_title(title)
        response = HTTP.get("https://www.omdbapi.com/?apikey=f44e65cd&t=#{title}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Plot"]
    end 

    def get_image_by_title(title)
        response = HTTP.get("https://www.omdbapi.com/?apikey=f44e65cd&t=#{title}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Poster"]
    end
end