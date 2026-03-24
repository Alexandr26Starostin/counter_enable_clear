//file ./hdl/counter.v
//module cnt_en_clr - counter_enable_clear 
//--------------------------------------------------------------------------------------------------

`define FPGA -- if we use FPGA, we need in button's delay (because button is the clk)
//------------------------------------
`ifdef FPGA
    `timescale 1ns / 1ps    //for button's delay
`endif
//------------------------------------

module cnt_en_clr #(
    parameter CNT_WIDTH = 8   //size of counter
)(
    input                    clk_i,
    input                    arstn_i, //reset -  synchronous with clk
                                      //      - asynchronous with clk (we use it!)
    input                    cnt_en_i,
    input                    cnt_clr_i,
    
    output [CNT_WIDTH -1 :0] cnt_o,
    output                   ovf_o 
);

reg [CNT_WIDTH :0] cnt_internal;
//reg                clr_execute;

always @(posedge clk_i or negedge arstn_i) begin
    if (! arstn_i) begin       //reset  ->  //ovf_o == '0 | cnt_o  == '0  (immediately after negedge arstn_i)  
        cnt_internal <= '0;   //cnt_internal <= '0;
    end 

    else if (cnt_clr_i) begin  //clear  ->  //ovf_o == '0 | cnt_o  == '0  (immediately after posedge clk_i)  
        cnt_internal <= '0;;    //cnt_internal <= '0;
    end

    else begin
        cnt_internal <= cnt_en_i ? cnt_internal + 1 : cnt_internal; 
    end
    
    //------------------------------------
    `ifdef FPGA 
        #1000;
    `endif
    //------------------------------------
end

assign {ovf_o, cnt_o} = cnt_internal;

endmodule
