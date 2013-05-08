
// load user_tweets page, initially with a loader gif, and then with the results of an AJAX request

  //THIS JAVASCRIPT FUNCTION DOES THE WORK AND RETURNS THE 
  //STRING WITH HTML ANCHOR LINKS 
  function replaceURLWithHTMLLinks(text) {
    var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
    return text.replace(exp,"<a href='$1' target='_blank'>$1</a>"); 
  }  

$.ajax({
  method: 'post',
  url: '/users_tweets',
  data: {twitter_user_name: $('#twitter_user_name').val()}
}).done(function (data) {
  $('.spinner').hide();
  $('.container').append(data);
  $(".user_tweets p").each(function(i){   //THIS IS A JQUERY STATEMENT THAT GRABS A CHUNK OF TEXT AND REPLACES IT WITH THE UPDATED STRING
    var text = $(this).html();
    $(this).html(replaceURLWithHTMLLinks(text));
  });
  $('.user_tweets').slideToggle();
  // $('.user_tweets').slideToggle();
}); 

