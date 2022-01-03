jQuery(function () {

//data table of article and Category

  lengthMenu = $(".data-table-div").data("lengthMenu");
  zeroRecords = $(".data-table-div").data("zeroRecords");
  info = $(".data-table-div").data("info");
  infoEmpty = $(".data-table-div").data("infoempty");
  infoFiltered = $(".data-table-div").data("infoFiltered");
  search = $(".data-table-div").data("search");

  $(".liste-item").DataTable({
    columnDefs: [
      { width: 200, targets: "title-article-th" },
      { width: 100, targets: "title-categ-th" },
      { width: 50, targets: "date-article-th" },
      { width: 50, targets: "action-article-th" },
    ],
    paging: true,
    language: {
      lengthMenu: "Display _MENU_ " + lengthMenu,
      zeroRecords: zeroRecords,
      info: info + " _PAGE_ of _PAGES_",
      infoEmpty: infoEmpty,
      infoFiltered: "(" + infoFiltered + " _MAX_ total records)",
      search: search,

      oPaginate: {
        sNext: '<i class="fas fa-angle-right"></i>',
        sPrevious: '<i class="fas fa-angle-left"></i>',
        sFirst: '<i class="fa fa-step-backward"></i>',
        sLast: '<i class="fa fa-step-forward"></i>',
      },
    },
  });


  //category actions

  $("#list-category").on("click", ".delete-categ", function () {
    category = $(this).attr("id");
    slug = $(this).data("slugCateg");
    labelCateg = $(this).data("labelLocal");
    $(".modal .confirm").addClass("confirme-delete");
    $(".var-message").text(labelCateg);

    $(".confirme-delete").on("click", function (e) {
      $.ajax({
        url: "/adminsicad/delete-category/" + slug,
        data: { category: category },
        method: "post",
        success: function (data) {
          if (data === "done") {
            $("#" + category)
              .closest(".row-categ")
              .remove();
          }
        },
        error: function (data) {
          if (data === "impossible") {
            messageError = $("#" + category).data("deleteError");
            $(".modal-message").text(messageError);
            $("#modal-default").modal("show");
          }
        },
      });
    });
  });



  //Article actions

  //delete Article from datatable
  $("#list-article").on("click", ".delete-article", function () {
    slugArticle = $(this).parent(".datatable-action").attr("id");
    titleArticle = $(this).data("titleArticle");

    $(".modal .confirm").addClass("confirme-delete");
    $(".var-message").text(titleArticle);

    $(".confirme-delete").on("click", function (e) {
      $.ajax({
        url: "/adminsicad/delete-article/" + slugArticle,
        data: { slugArticle: slugArticle },
        method: "post",
        success: function (data) {
          if (data === "done") {
            $("#" + slugArticle)
              .closest(".row-item")
              .remove();
          }
        },
        error: function (data) {
          if (data === "impossible") {
            messageError = $("#" + slugArticle).data("deleteError");
            $(".modal-message").text(messageError);
            $("#modal-default").modal("show");
          }
        },
      });
    });
  });


  //Validate Article from datatable

  $("#list-article").on("click", ".validate-article", function (e) {
    e.preventDefault();
    slugArticle = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/validate-article/" + slugArticle,
      data: { slugArticle: slugArticle },
      method: "post",
      success: function (data) {
       
        if (data === true) {
          $("#" + slugArticle + "  .validate-article i")
            .removeClass("invalid-article")
            .addClass("valid-article");
        } else if (data === false) {
          $("#" + slugArticle + "  .validate-article i")
            .removeClass("valid-article")
            .addClass("invalid-article");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });


   //Publish Article from datatable
  $("#list-article").on("click", ".publish-article", function (e) {
    e.preventDefault();
    slugArticle = $(this).parent(".datatable-action").attr("id");

    $.ajax({
      url: "/adminsicad/publish-article/" + slugArticle,
      data: { slugArticle: slugArticle },
      method: "post",
      success: function (data) {
      
        if (data === true) {
          $("#" + slugArticle + "  .publish-article i")
            .removeClass("inpublish-article")
            .addClass("publish-article");
        } else if (data === false) {
          $("#" + slugArticle + "  .publish-article i")
            .removeClass("publish-article")
            .addClass("inpublish-article");
        }
      },
      error: function (data) {
        if (data === "impossible") {
        }
      },
    });
  });

  
});
