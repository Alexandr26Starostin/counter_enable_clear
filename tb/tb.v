//file ./tb/tb.v
//iverilog ./hdl/counter.v ./tb/tb.v -g2005-sv -o counter
//./counter
//gtkwave dump.vcd

`timescale 1ns/1ps

//----------------------------
`define GUI_ENABLED
//----------------------------

module cnt_en_clr_tb ();

//--------------------------------------------------------------------------------------

localparam CNT_WIDTH = 8;

reg                   clk_i;
reg                   arstn_i;
reg                   cnt_en_i;
reg                   cnt_clr_i;
wire [CNT_WIDTH-1 :0] cnt_o;
wire                  ovf_o;


cnt_en_clr #(
    .CNT_WIDTH  (CNT_WIDTH)
) cnt_en_clr_inst_tb (
    .clk_i     (clk_i),
    .arstn_i   (arstn_i),

    .cnt_en_i  (cnt_en_i),
    .cnt_clr_i (cnt_clr_i),

    .cnt_o     (cnt_o),
    .ovf_o     (ovf_o)
);

//-------------------------------------------------------------------------------------
//graphic dump

`ifdef GUI_ENABLED 
initial begin
    $dumpvars;

    clk_i      = 1'b0;      //<= - неблокирующее присваивание (параллельно со всеми остальными)
    arstn_i    = 1'b1;      //=  - блокирующее присваивание   (последовательно, друг за другом)
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #4;

    clk_i      = 1'b0;
    arstn_i    = 1'b0;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #6;                       //10

    clk_i      = 1'b1;
    arstn_i    = 1'b0;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;        //20
    #10
   
    clk_i      = 1'b0;
    arstn_i    = 1'b0;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #5
   
    clk_i      = 1'b0;
    arstn_i    = 1'b0;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #5                         //30

    clk_i      = 1'b1;
    arstn_i    = 1'b0;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #4

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #6                        //40

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                       //50

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                      //60

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                      //70

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #5

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #5                      //80

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #10                      //90

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #10                      //100

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #3

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #7                      //110

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                      //120

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #6

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b1;
    #4                       //130

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b1;
    #10                    //140

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b1;
    #7

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #3                      //150

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                     //160

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                     //170

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                     //180

    //--------------------------------------------------------

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                     //190

    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #10                     //200

    //--------------------------------------------------------

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b1;
    cnt_clr_i  = 1'b0;
    #4                     

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b0;
    #2

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b1;
    #3                     //210      
    
    clk_i      = 1'b1;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b1;
    #10                     //220

    clk_i      = 1'b0;
    arstn_i    = 1'b1;
    cnt_en_i   = 1'b0;
    cnt_clr_i  = 1'b1;
    #10                     //230
    
    //------------------------------------------------------------------
    // $display();
    // $display("------------------------------------------------------------");
    // $display ("PASS: 'multibit_adder' test PASSED!");
    // $display("------------------------------------------------------------");
    // $display();

    $finish;
end
`endif

//-------------------------------------------------------------------------------------
//generating of tests  
`ifndef GUI_ENABLED
`endif

//---------------------------------------------------------------------------------------
//reaction --  automatic verification

endmodule
