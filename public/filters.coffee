angular.module('freshigerator')
	.filter('capitalize', -> 
	  return (token) -> 
	    return token.charAt(0).toUpperCase() + token.slice(1)
	   
	);