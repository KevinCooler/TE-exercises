<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<c:import url="/WEB-INF/jsp/header.jsp"/>

    	<table class="list-table" border=1 frame=void rules=rows>
    		<c:forEach var="product" items="${productList}">
    			<tr>
	    			<td class="image-container">
	    				<c:url value="/productDetail" var="productDetailURL">
							<c:param name="productId" value="${product.productId}"/>
						</c:url>
						<a href="${productDetailURL}">
							<img class="toy-image" src="img/${product.imageName}" alt="toy image">
						</a>
	    			</td>
	    			<td class="information">
	    				<div class="product-name">
	    					<c:set var="displayBestSeller" value=""/>
	    					<c:if test="${product.topSeller}">
			 					<c:set var="displayBestSeller" value="BEST SELLER!" />
			 				</c:if>
			 				<c:out value="${product.name}"/>
			 				<span class="best-seller"><c:out value="${displayBestSeller}"/></span>
	    				</div>
	    				<div class="manufacturer">
	    					<c:out value="by ${product.manufacturer}"/>
	    				</div>
	    				<div class="price">
	    					$<c:out value="${product.price}"/>
	    				</div>
	    				<div>
	    					<span class="weight">Weight </span><c:out value="${product.weightInLbs} lbs"/>
	    				</div>
	    				<div class="stars-container">
	    					<img class="stars" src="img/<fmt:formatNumber type="number" maxFractionDigits="0" value="${product.averageRating}"/>-star.png" alt="star rating">
	    				</div>
	    			</td>
	    		</tr>	
    		</c:forEach> 
    	</table>

<c:import url="/WEB-INF/jsp/footer.jsp"/>
