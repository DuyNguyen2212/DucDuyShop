<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><decorator:title default="HiroShop"/></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/assets/form/css/style.css" />">
</head>

<body>
    <decorator:body />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value="/assets/js/validator.js" />"></script>
    <decorator:getProperty property="page.script" ></decorator:getProperty>
    
    <script>
    var mess_container = document.querySelector('.mess-container')
    mess_container.onclick = function() {
      mess_container.classList.remove('d-flex')
    }
    
    var check = document.querySelector('#check')
    var namename = document.querySelector('#name')
    var email = document.querySelector('#email')
    var password = document.querySelector('#password')
    if(check) {
    	namename.value = ''
    	email.value= ''
    	password.value = ''
    }
    
    var messages = document.querySelectorAll('.e-message');
    Array.from(messages).forEach(message => {
      if(message.innerHTML != null) {
        setTimeout(function() {
          message.innerHTML = '';
        }, 5000)
      }
    })
  </script>
</body>

</html>