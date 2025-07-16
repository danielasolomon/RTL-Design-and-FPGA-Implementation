module green(                   
input                     clk            , // 50 MHz
input                     rst            , // Asynchronous Reset active high
input                     en             , // enable
output                    h_sync         , // Horizontal Synchronization
output                    v_sync         , // Vertical Synchronization
output reg                red            , 
output reg                blue           ,
output reg                green
);

parameter H_ACTIVE = 800;
parameter H_FP = 56;
parameter H_SYNC_PULSE = 120;
parameter H_BP = 64;
parameter H_TOTAL = 1040;

parameter V_ACTIVE = 600;
parameter V_FP = 37;
parameter V_SYNC_PULSE = 6;
parameter V_BP = 23;
parameter V_TOTAL = 666;




localparam Y1 = 100;
localparam Y2 = 300;
localparam Y3 = 500;

//cercuri mici prima linie
localparam X1 = 100; 
localparam X2 = 300;
localparam X3 = 500;
localparam X4 = 700;

localparam R1 = 50;

// semiluna ,semicercuri, a doua linie
localparam X5 = 425;// cerc mijloc colorat
localparam X6 = 455;// cerc mijloc alb
localparam X7 = 200;//semicerc stg
localparam X8 = 600;//semicerc dr

localparam R2 = 70;

//romb

localparam X_sus = 100;
localparam X_dr  = 50;
localparam X_jos = 100;
localparam X_stg = 150;

localparam Y_sus = 450;
localparam Y_dr  = 500;
localparam Y_jos = 550;
localparam Y_stg = 500;



// counter pixel si linii
reg [11:0] h_count;
reg [11:0] v_count;

//counter pixeli
always @(posedge clk or posedge rst) 
if (rst)                        h_count <= 0; else 
if (h_count == H_TOTAL - 1)     h_count <= 0; else 
                                h_count <= h_count + 1;
                              
//counter linii                           
always @(posedge clk or posedge rst) 
if (rst)                        v_count <= 0; else 
if (v_count == V_TOTAL)         v_count <= 0; else 
if (h_count == H_TOTAL - 1)     v_count <= v_count + 1;



assign h_sync = ~((h_count >= (H_ACTIVE + H_FP))  && (h_count < (H_ACTIVE + H_FP + H_SYNC_PULSE)));

                              
assign v_sync = ~((v_count >= (V_ACTIVE + V_FP)) && (v_count < (V_ACTIVE + V_FP + V_SYNC_PULSE)));   
                               
			  

always @(posedge clk or posedge rst) begin
if (rst) begin 
    red   <= 0;
    green <= 0;
    blue  <= 0;
end else 
if((h_count >= 0 && h_count < H_ACTIVE-1) && (v_count >= 0 && v_count < V_ACTIVE-1) && (en == 1))begin

  if ((h_count >= 100 ? h_count - 100 : 100 - h_count) + (v_count >= 500 ? v_count - 500 : 500 - v_count) < 50) begin
        red   <= 0; // cyan
        green <= 1;
        blue  <= 1;
  end else
  if(( v_count - Y1) * (v_count - Y1) + (h_count - X1) * (h_count - X1) < R1 * R1) begin
        red   <= 0; //verde
        green <= 1;
        blue  <= 0;
  end else 
  if(( v_count - Y1) * (v_count - Y1) + (h_count - X2) * (h_count - X2) < R1 * R1 ) begin
        red   <= 0; //verde
        green <= 1;
        blue  <= 0;
  end else
  if(( v_count - Y1) * (v_count - Y1) + (h_count - X3) * (h_count - X3) < R1 * R1 ) begin
        red   <= 0; //verde
        green <= 1;
        blue  <= 0;
  end else
  if(( v_count - Y1) * (v_count - Y1) + (h_count - X4) * (h_count - X4) < R1 * R1 ) begin
        red   <= 0; //verde
        green <= 1;
        blue  <= 0;
  end else
  if(( v_count - Y2) * (v_count - Y2) + (h_count - X5) * (h_count - X5) < R2 * R2 &&  ( v_count - Y2) * (v_count - Y2) + (h_count - X6) * (h_count - X6) > R1 * R1) begin
        red   <= 0; //albastru
        green <= 0;
        blue  <= 1;
  end else
  if( h_count > X7 && ( v_count - Y2) * (v_count - Y2) + (h_count - X7) * (h_count - X7) < R2 * R2 ) begin
        red   <= 0; //albastru
        green <= 0;
        blue  <= 1;
  end else
  if(h_count < X8 && ( v_count - Y2) * (v_count - Y2) + (h_count - X8) * (h_count - X8) < R2 * R2) begin
        red   <= 0; //albastru
        green <= 0;
        blue  <= 1;
  end else
  if ((h_count >= 200 && h_count <= 300)&&(v_count >= 450 && v_count <= 550)) begin
        red   <= 0; // cyan
        green <= 1;
        blue  <= 1;
  end else
  if ((h_count >= 350 && h_count <= 550)&&(v_count >= 450 && v_count <= 550)) begin
        red   <= 0; // cyan
        green <= 1;
        blue  <= 1;
	end else  if ((h_count >= 600) && (h_count <= 750) && (v_count >= 400) && (v_count <= 550) && 
	             (v_count >= (550 - (h_count - 600))) && (v_count >= (550 - (750 - h_count)))) begin
	    red   <= 0; // cyan
      green <= 1;
      blue  <= 1;
  end else  begin
      red   <= 1; //alb
      green <= 1;
      blue  <= 1;
  end
  end else begin
    red   <= 0;
    green <= 0;
    blue  <= 0;
end
end           


endmodule //green