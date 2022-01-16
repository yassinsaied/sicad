/* upload multiple images for add & edit article form */
jQuery(function () {
  /* function for add image in drop zone */

  $(".drop-zone-container").on("click", "#images-article", function () {
    if ($(".msg-dropzone").length) {
      $(".msg-dropzone").remove();
    }

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
  });

  deleteImage();
  updateCounterWidget();

  /* function for read path of image and sho it in drop zone */

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
/* function to delete image from drop zone */

  function deleteImage(e) {
    $(".drop-zone-container").on(
      "click",
      ".frame-image .remove-image",
      function (e) {
        e.stopPropagation();
        $(this).closest(".frame-image").remove();
        const idInputToDelete = $(this).data("idElement");

        $(
          `.drop-zone-container #block_article_images_${idInputToDelete}`
        ).remove();
      }
    );
  }
/* function used to update number of image in drop zone*/

  function updateCounterWidget() {
    const counterImages = +$(".drop-zone-container .image-article-widget")
      .length;
    $("#counter-widget").val(counterImages);
  }

 
});
