$(function(){
		
	$('#thumbnail li').click(function(){
		var thisIndex = $(this).index()
			
		if(thisIndex < $('#thumbnail li.active').index()){
			prevImage(thisIndex, $(this).parents("#thumbnail").prev("#image-slider"));
		}else if(thisIndex > $('#thumbnail li.active').index()){
			nextImage(thisIndex, $(this).parents("#thumbnail").prev("#image-slider"));
		}
			
		$('#thumbnail li.active').removeClass('active');
		$(this).addClass('active');

		});
	});

var width = $('#image-slider').width();

function nextImage(newIndex, parent){
	parent.find('li').eq(newIndex).addClass('next-img').css('left', width).animate({left: 0},600);
	parent.find('li.active-img').removeClass('active-img').css('left', '0').animate({left: -width},600);
	parent.find('li.next-img').attr('class', 'active-img');
}
function prevImage(newIndex, parent){
	parent.find('li').eq(newIndex).addClass('next-img').css('left', -width).animate({left: 0},600);
	parent.find('li.active-img').removeClass('active-img').css('left', '0').animate({left: width},600);
	parent.find('li.next-img').attr('class', 'active-img');
}

/* Thumbails *//*
var ThumbailsWidth = ($('#image-slider').width() - 18.5)/5;
$('#thumbnail li').find('img').css('width', ThumbailsWidth);*/

