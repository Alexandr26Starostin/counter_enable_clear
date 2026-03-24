//file ./hdl/top.v
//for FPGA

module top #(
    parameter COUNTER_SIZE  = 4,
    parameter COUNT_SW      = 3,
    parameter COUNT_LED     = COUNTER_SIZE + 1
)(
    input  [COUNT_SW  - 1 :0] sw,
    input                     btnC,
    output [COUNT_LED - 1 :0] led     //0 <= i <= COUNTER_SIZE - 1:  led [i]            == counter[i]
                                      //                             led [COUNTER_SIZE] == overflow
);

wire [COUNTER_SIZE -1 :0] counter;
wire                      overflow;

assign {overflow, counter} = led;

cnt_en_clr #(
    .CNT_WIDTH  (COUNTER_SIZE)
) cnt_en_clr_inst_for_fpga (
    .clk_i     (btnC),
    .arstn_i   (sw [0]),

    .cnt_en_i  (sw [1]),
    .cnt_clr_i (sw [2]),

    .cnt_o     (counter),
    .ovf_o     (overflow)
);

endmodule
