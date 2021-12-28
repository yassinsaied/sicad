/* upload multiple images for add & edit article form */
jQuery(function () {

  $("#images-article").on("click", function (e) {
    const numberOfImages = +$("#counter-widget").val();
    const tmpl = $("#images-article")
      .attr("data-prototype")
      .replace(/__name__/g, numberOfImages);

    $(".drop-zone-container").append(tmpl);
    $("#article_images_" + numberOfImages + "_imagefile").trigger("click");
    $("#article_images_" + numberOfImages + "_imagefile").on(
      "change",
      function () {
        readURL(this, numberOfImages);
      }
    );

    $("#counter-widget").val(numberOfImages + 1);

    deleteImage(e);
  });

  
  function readURL(input, idElement) {
      
    for (let i = 0; i < input.files.length; i++) {
      if (input.files && input.files[i]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $("#images-article").append(
            '<div class="frame-image col-xl-4 col-lg-4 col-md-6 col-sm-12"> <div class="card card-stats"> <div class="card-body"> <img  src="' +
              e.target.result +
              '"/><div class="d-flex justify-content-end"><a class="remove-image"  data-id-element="' +
              idElement +
              '"><i class="fas fa-trash-alt"></i></a></div> </div></div></div>'
          );
        };

        reader.readAsDataURL(input.files[i]);
      }
    }
  }

  function deleteImage(e) {
    $("#images-article").on("click", ".remove-image", function (e) {
      e.stopPropagation();
      $(this).closest(".frame-image").remove();
      const idInputToDelete = $(this).data("idElement");
      $(
        ".drop-zone-container #block_article_images_" + idInputToDelete
      ).remove();
    });
  }

  function updateCounterWidget() {
    const counterImages = +$("#images-article .form-group").length;
    $("#counter-widget").val(counterImages);
  }

  updateCounterWidget();
});
