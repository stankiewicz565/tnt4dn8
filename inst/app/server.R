library(shiny)
library(tnt4dn8)

#' demo server
#' @importFrom shinytoastr toastr_info
#' @importFrom TnT renderTnT
server = function(input, output, session) {
  build_gt = reactive({
    shinytoastr::toastr_info("building global gene models...")
    txdb38 = GenomeInfoDb::keepStandardChromosomes(TxDb.Hsapiens.UCSC.hg38.knownGene)
    tt = TnT::TxTrackFromTxDb(txdb38, height=400, color="darkred", seqlevel="chr20")
    GT = TnT::GeneTrackFromTxDb(txdb38, height=100, color="darkgreen", seqlevel="chr20")
    list(tt=tt, GT=GT)
    })
  output$gname = renderPrint({
    cat(paste(input$gene, "in GTEx Lung."))
  })
  output$tntmanh = TnT::renderTnT({
   shinytoastr::toastr_info("filtering annotations...", position="top-center")
   sym = input$gene
   rad = input$radius
   #here I have to add the data banks options 
   data(eval(as.symbol(input$track1)))
   data(eval(as.symbol(input$track2)))
   data(eval(as.symbol(input$track3)))
   tab = (eval(as.symbol(input$track1))) |> filter_sym(sym, radius=rad) |> as.data.frame()
   tab2 = (eval(as.symbol(input$track2))) |> filter_sym(sym, radius=rad) |> as.data.frame()
   tab3 = (eval(as.symbol(input$track3))) |> filter_sym(sym, radius=rad) |> as.data.frame()
   bgt = build_gt()
   tntplot5(tab, tab2, tab3, tt=bgt$tt, GT=bgt$GT, lab1="GTEx Lung", lab2="EBI GWASCAT", lab3="awesome")
  })
  output$desc = renderPrint({
   packageDescription("tnt4dn8")
  })
  output$eqtltab = DT::renderDataTable({
   sym = input$gene
   rad = input$radius
   data(eval(as.symbol(input$track1)))
   (eval(as.symbol(input$track1))) |> filter_sym(sym, radius=rad) |> as.data.frame()
  })
  output$gwastab = DT::renderDataTable({
   sym = input$gene
   rad = input$radius
   data(eval(as.symbol(input$track2)))
   (eval(as.symbol(input$track2)))|> filter_sym(sym, radius=rad) |> as.data.frame()
  })
  output$track3 =  DT::renderDataTable({
     ym = input$gene
     rad = input$radius
     data(eval(as.symbol(input$track3)))
     (eval(as.symbol(input$track3))) |> filter_sym(sym, radius=rad) |> as.data.frame()
  }
  )
  observeEvent(input$stopBtn, {
    stopApp(NULL)
    })
}

