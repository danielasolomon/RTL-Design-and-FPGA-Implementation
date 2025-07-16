module cerc1(                   
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

localparam Y = 300;
localparam X1 = 400;
localparam R = 150;

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
  if(( v_count - Y) * (v_count - Y) + (h_count - X1) * (h_count - X1) < R * R ) begin
        red   <= 0; //verde
        green <= 1;
        blue  <= 0;
  end else begin
        red   <= 1; //galben
        green <= 1;
        blue  <= 0;
  end
end else begin
    red   <= 0;
    green <= 0;
    blue  <= 0;
end
end


endmodule //green