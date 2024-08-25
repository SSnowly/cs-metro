$(document).ready(function() {
    $('#close').click(function() {
        $('#container').hide();
        $.post(`https://${GetParentResourceName()}/exit`);
    });
});

$(document).ready(function() {
    $('#buy').click(function() {
        $('#container').hide();
        $.post(`https://${GetParentResourceName()}/buy`);
    });
});

function display(bool) {
    if (bool) {
      $("#container").show();
    } else {
      $("#container").hide();
       $.post(`https://${GetParentResourceName()}/exit`);
    }
  }

$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == 'openUI') {
            display(true);
            $('#container').css('visibility', 'visible')
        } else if (event.data.type == 'closeUI') {
            $('#container').css('visibility', 'hidden')
        }
    })
})

document.onkeyup = function(data) {
    if (data.which == 27) {
        $('#container').css('visibility', 'hidden');
        setTimeout(function() {
            $.post(`http://cs-metro/closeTicketUI`, JSON.stringify({}), function(data) {
            });
        }, 100); // Adjust the delay as needed
    }
}

window.addEventListener("keyup", (event) => {
    event.preventDefault();
    if (event.keyCode == 27) {
      display(false);
    exit()
    }
  })
  
  function exit() {
    $.post(`https://${GetParentResourceName()}/exit`);
  }


$('#buy').click(function(){
    $.post(`https://${GetParentResourceName()}/buy`, JSON.stringify({}));
    exit()
})

window.addEventListener('message', function(event) {
    if (event.data.type == 'setPrice') {
        $('#priceElement').html(event.data.symbol + event.data.price);
    }
});