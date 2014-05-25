define 'app/search', ['typeahead.bundle', 'app/p13n', 'app/settings'], (ta, p13n, settings) ->
    lang = p13n.get_language()
    engine = new Bloodhound
        name: 'suggestions'
        remote:
            url: sm_settings.backend_url + "/search/?language=#{lang}&input=%QUERY"
            ajax: settings.applyAjaxDefaults {}
            filter: (parsedResponse) ->
                parsedResponse.results
        datumTokenizer: (datum) -> Bloodhound.tokenizers.whitespace datum.name[lang]
        queryTokenizer: Bloodhound.tokenizers.whitespace

    promise = engine.initialize()
    promise.done -> true
    promise.fail -> false

    return engine: engine
