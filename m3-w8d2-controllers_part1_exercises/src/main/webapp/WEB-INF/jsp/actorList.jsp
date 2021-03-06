<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="All Actors List"/>

<%@include file="common/header.jspf"%>

<c:url value="/actorList" var="formAction" />
<form method="GET" action="${formAction}">
	<label for="actorSearch">Search Actor by Last Name: </label>
	<input type="text" id="actorSearch" name="actorSearch" />
	<input type="submit" value="Submit" />
</form>

<table class="table">
	<tr>
		<th>Name</th>
	</tr>
	<c:forEach items="${actors}" var="actor">
		<tr>
    		<td>${actor.firstName} ${actor.lastName}</td>
		</tr>
	</c:forEach>
</table>

<%@include file="common/footer.jspf"%>