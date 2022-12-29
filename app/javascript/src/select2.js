$("#expression_word_id").select2({
    createTag: function (params) {
        var term = (params.term).trim();
    
        if (term === '') {
          return null;
        }
        console.log(term)
        return {
          id: term,
          text: term,
          newTag: true // add additional parameters
        }
        console.log(id) 
      },
    tags: true,
    tokenSeparators: [',', ' ']
})