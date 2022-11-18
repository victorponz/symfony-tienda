//Immediately-Invoked Function Expression (IIFE)
(function(){
    const infoProduct = $("#infoProduct");
    $( "a.open-info-product" ).click(function(event) {
      event.preventDefault();
      let id = $( this ).attr('data-id');
      let href = `/api/show/${id}`;
      var jqxhr = $.get( href, function(data) {
        $( infoProduct ).find( "#productName" ).text(data.name);
        $( infoProduct ).find( "#productPrice" ).text(data.price);
        $( infoProduct ).find( "#productImage" ).attr("src", "/img/" + data.photo);
        infoProduct.modal('show');
      })
    });
    $(".closeInfoProduct").click(function (e) {
      infoProduct.modal('hide');
    });

    const cartModal = $("#cart-modal");
   
    $( "a.open-cart-product" ).click(function(event) {
      event.preventDefault();
      let id = $( this ).attr('data-id');
      let href = `/cart/add/${id}`;
      var jqxhr = $.get( href, function(data) {       
        $( cartModal ).find( ".name" ).text(data.name);
        $( cartModal ).find( "#quantity" ).text(data.quantity);
        $( cartModal ).find( ".img-thumbnail" ).attr("src", "/img/" + data.photo);
        cartModal.modal('show');     
      })
    });
    $(".closeCart").click(function (e) {
      cartModal.modal('hide');
    });

    

})();