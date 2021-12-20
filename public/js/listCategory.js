jQuery(function () {
  lengthMenu = $(".data-table-div").data("lengthMenu");
  zeroRecords = $(".data-table-div").data("zeroRecords");
  info = $(".data-table-div").data("info");
  infoEmpty = $(".data-table-div").data("infoempty");
  infoFiltered = $(".data-table-div").data("infoFiltered");
  search = $(".data-table-div").data("search");

  $("#list-category").DataTable({
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

  $(".delete-categ").on("click", function () {
    category = $(this).attr("id");
    slug = $(this).data("slugCateg");
    labelCateg = $(this).data("labelLocal");

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
});
