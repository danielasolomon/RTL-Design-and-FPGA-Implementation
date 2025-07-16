module inel_mergator(                   
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



//animatie
reg [26-1:0] counter;
reg [2:0] counter2;
reg set_reset;
wire pulse;

localparam Y1 = 200;
localparam Y2 = 400;
localparam X1 = 166;
localparam X2 = 282;
localparam X3 = 398;
localparam X4 = 514;
localparam X5 = 636;
localparam X6 = 746;
localparam R = 50;

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
                               

// animatie cercuri
always @(posedge clk or posedge rst)
if (rst)       counter <='d10000000; else
if (~|counter) 
               counter <='d10000000; else
               counter <= counter - 1;

assign pulse = ~|counter;  //assign pulse = (counter==0);
                           

always @(posedge clk or posedge rst)
if (rst)            set_reset <= 'd0; else
if(pulse) begin
if(counter2 == 0)   set_reset <= 'd1; else
if(counter2 == 5)   set_reset <= 'd0;
end

always @(posedge clk or posedge rst)
if (rst)            counter2 <='d0;     else
if(pulse) begin
if ((counter2 == 5) & (set_reset == 1))
						  counter2 <= counter2;     else
if ((counter2 == 0) & (set_reset == 0))
						  counter2 <= counter2;     else
if (set_reset == 0) counter2 <= counter2 - 1; else
                    counter2 <= counter2 + 1;
end				  



always @(posedge clk or posedge rst) begin
if (rst) begin 
    red   <= 0;
    green <= 0;
    blue  <= 0;
end else 
if((h_count >= 0 && h_count < H_ACTIVE-1) && (v_count >= 0 && v_count < V_ACTIVE-1) && (en == 1))begin
  if( ( ( v_count - Y1) * (v_count - Y1) + (h_count - X1) * (h_count - X1) < R * R) && (counter2==0) && (set_reset==0) ) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y1) * (v_count - Y1) + (h_count - X2) * (h_count - X2) < R * R) && (counter2==1) && (set_reset==0) ) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y1) * (v_count - Y1) + (h_count - X3) * (h_count - X3) < R * R) && (counter2==2) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y1) * (v_count - Y1) + (h_count - X4) * (h_count - X4) < R * R) && (counter2==3) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y1) * (v_count - Y1) + (h_count - X5) * (h_count - X5) < R * R) && (counter2==4) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y1) * (v_count - Y1) + (h_count - X6) * (h_count - X6) < R * R) && (counter2==5) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else
  if( ( ( v_count - Y2) * (v_count - Y1) + (h_count - X1) * (h_count - X1) < R * R) && (counter2==0) && (set_reset==0) ) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y2) * (v_count - Y1) + (h_count - X2) * (h_count - X2) < R * R) && (counter2==1) && (set_reset==0) ) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y2) * (v_count - Y1) + (h_count - X3) * (h_count - X3) < R * R) && (counter2==2) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y2) * (v_count - Y1) + (h_count - X4) * (h_count - X4) < R * R) && (counter2==3) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y2) * (v_count - Y1) + (h_count - X5) * (h_count - X5) < R * R) && (counter2==4) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else 
  if( ( ( v_count - Y2) * (v_count - Y1) + (h_count - X6) * (h_count - X6) < R * R) && (counter2==5) && (set_reset==0)) begin
        red   <= 0; //cyan
        green <= 1;
        blue  <= 1;
  end else begin
        red   <= 0; //albstru
        green <= 0;
        blue  <= 1;
  end
end else begin
    red   <= 0;
    green <= 0;
    blue  <= 0;
end
end


endmodule //green