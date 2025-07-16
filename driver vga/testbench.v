`timescale 1ns/1ns
module testbench;

reg  clk   ;     
reg  rst   ;     
reg  en    ;     
wire h_sync;     
wire v_sync;     
wire red   ;     
wire blue  ;     
wire green ;

parameter BP_FIRST =   0  ;  
parameter HVA      =   800;
parameter HFP      =   56 ;
parameter HP       =   120;
parameter HBP      =   64 ;
parameter VVA      =   600;
parameter VFP      =   37 ;
parameter VP       =   6  ;
parameter VBP      =   23 ;
parameter TP       =   0  ;





// 5 GHz clock generator
initial begin
  clk <= 0;
  forever #10 clk <= ~clk;
end


initial begin
  
  rst  <= 0;
  en <= 0;

  repeat (5) @(posedge clk);
  rst <= 1;

  repeat (5) @(posedge clk);
  rst <= 0;

  repeat (5) @(posedge clk);
  en <= 1;


  repeat (500000000) @(posedge clk);

  $stop;
end

green i_green(
  .clk    (clk    ),
  .rst    (rst    ),
  .en     (en     ),
  .h_sync (h_sync ),
  .v_sync (v_sync ),
  .red    (red    ),
  .blue   (blue   ),
  .green  (green  )

);

vga_monitor #(
  .BP_FIRST(BP_FIRST),
  .HVA     (HVA     ),
  .HFP     (HFP     ),
  .HP      (HP      ),
  .HBP     (HBP     ),
  .VVA     (VVA     ),
  .VFP     (VFP     ),
  .VP      (VP      ),
  .VBP     (VBP     ),
  .TP      (TP      )
)i_vga_monitor(
  .clk   (clk   ),
  .enable(en    ),
  .reset (rst   ),
  .hsync (h_sync),
  .vsync (v_sync),
  .r     (red   ),
  .g     (green ),
  .b     (blue  ) 
);

endmodule