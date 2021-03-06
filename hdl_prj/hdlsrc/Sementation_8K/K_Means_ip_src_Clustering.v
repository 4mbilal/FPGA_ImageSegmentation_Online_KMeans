// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\Sementation_8K\K_Means_ip_src_Clustering.v
// Created: 2019-03-29 13:41:03
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: K_Means_ip_src_Clustering
// Source Path: Sementation_8K/Segmentation_HW/K-Means/Clustering
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module K_Means_ip_src_Clustering
          (clk,
           reset,
           enb,
           K_addr,
           RGB_pixel_0,
           RGB_pixel_1,
           RGB_pixel_2,
           Ctrl_vStart,
           Ctrl_valid,
           K_out_0,
           K_out_1,
           K_out_2,
           K_out_3,
           K_out_4,
           K_out_5,
           K_out_6,
           K_out_7,
           K_out_8,
           K_out_9,
           K_out_10,
           K_out_11,
           K_out_12,
           K_out_13,
           K_out_14,
           K_out_15,
           K_out_16,
           K_out_17,
           K_out_18,
           K_out_19,
           K_out_20,
           K_out_21,
           K_out_22,
           K_out_23);


  input   clk;
  input   reset;
  input   enb;
  input   [2:0] K_addr;  // ufix3
  input   signed [17:0] RGB_pixel_0;  // sfix18_En8
  input   signed [17:0] RGB_pixel_1;  // sfix18_En8
  input   signed [17:0] RGB_pixel_2;  // sfix18_En8
  input   Ctrl_vStart;
  input   Ctrl_valid;
  output  signed [17:0] K_out_0;  // sfix18_En8
  output  signed [17:0] K_out_1;  // sfix18_En8
  output  signed [17:0] K_out_2;  // sfix18_En8
  output  signed [17:0] K_out_3;  // sfix18_En8
  output  signed [17:0] K_out_4;  // sfix18_En8
  output  signed [17:0] K_out_5;  // sfix18_En8
  output  signed [17:0] K_out_6;  // sfix18_En8
  output  signed [17:0] K_out_7;  // sfix18_En8
  output  signed [17:0] K_out_8;  // sfix18_En8
  output  signed [17:0] K_out_9;  // sfix18_En8
  output  signed [17:0] K_out_10;  // sfix18_En8
  output  signed [17:0] K_out_11;  // sfix18_En8
  output  signed [17:0] K_out_12;  // sfix18_En8
  output  signed [17:0] K_out_13;  // sfix18_En8
  output  signed [17:0] K_out_14;  // sfix18_En8
  output  signed [17:0] K_out_15;  // sfix18_En8
  output  signed [17:0] K_out_16;  // sfix18_En8
  output  signed [17:0] K_out_17;  // sfix18_En8
  output  signed [17:0] K_out_18;  // sfix18_En8
  output  signed [17:0] K_out_19;  // sfix18_En8
  output  signed [17:0] K_out_20;  // sfix18_En8
  output  signed [17:0] K_out_21;  // sfix18_En8
  output  signed [17:0] K_out_22;  // sfix18_En8
  output  signed [17:0] K_out_23;  // sfix18_En8


  wire valid;
  wire vStart;
  reg [11:0] HDL_Counter_out1;  // ufix12
  wire signed [17:0] Delay3_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB7_0;  // sfix18_En8
  wire signed [17:0] RGB7_1;  // sfix18_En8
  wire signed [17:0] RGB7_2;  // sfix18_En8
  wire signed [17:0] RGB7 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay3_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay3_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay3_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay3_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay6_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB6_0;  // sfix18_En8
  wire signed [17:0] RGB6_1;  // sfix18_En8
  wire signed [17:0] RGB6_2;  // sfix18_En8
  wire signed [17:0] RGB6 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay6_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay6_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay6_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay6_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay7_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB5_0;  // sfix18_En8
  wire signed [17:0] RGB5_1;  // sfix18_En8
  wire signed [17:0] RGB5_2;  // sfix18_En8
  wire signed [17:0] RGB5 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay7_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay7_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay7_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay7_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay2_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB4_0;  // sfix18_En8
  wire signed [17:0] RGB4_1;  // sfix18_En8
  wire signed [17:0] RGB4_2;  // sfix18_En8
  wire signed [17:0] RGB4 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay2_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay2_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay2_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay2_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay5_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB3_0;  // sfix18_En8
  wire signed [17:0] RGB3_1;  // sfix18_En8
  wire signed [17:0] RGB3_2;  // sfix18_En8
  wire signed [17:0] RGB3 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay5_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay5_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay5_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay5_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay4_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB2_0;  // sfix18_En8
  wire signed [17:0] RGB2_1;  // sfix18_En8
  wire signed [17:0] RGB2_2;  // sfix18_En8
  wire signed [17:0] RGB2 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay4_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay4_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay4_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay4_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay1_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB1_0;  // sfix18_En8
  wire signed [17:0] RGB1_1;  // sfix18_En8
  wire signed [17:0] RGB1_2;  // sfix18_En8
  wire signed [17:0] RGB1 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay1_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay1_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay1_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay1_reg_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay_out1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] RGB0_0;  // sfix18_En8
  wire signed [17:0] RGB0_1;  // sfix18_En8
  wire signed [17:0] RGB0_2;  // sfix18_En8
  wire signed [17:0] RGB0 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] Delay_bypass_delay [0:2];  // sfix18 [3]
  reg signed [17:0] Delay_reg [0:2];  // sfix18 [3]
  wire signed [17:0] Delay_bypass_delay_next [0:2];  // sfix18_En8 [3]
  wire signed [17:0] Delay_reg_next [0:2];  // sfix18_En8 [3]


  assign valid = Ctrl_valid;

  assign vStart = Ctrl_vStart;

  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : HDL_Counter_process
      if (reset == 1'b1) begin
        HDL_Counter_out1 <= 12'b000000000000;
      end
      else begin
        if (enb && vStart) begin
          HDL_Counter_out1 <= HDL_Counter_out1 + 12'b000000000001;
        end
      end
    end



  assign RGB7[0] = RGB7_0;
  assign RGB7[1] = RGB7_1;
  assign RGB7[2] = RGB7_2;

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_bypass_delay[0] <= 18'sb000000000000000000;
        Delay3_bypass_delay[1] <= 18'sb000000000000000000;
        Delay3_bypass_delay[2] <= 18'sb000000000000000000;
        Delay3_reg[0] <= 18'sb000000000000000000;
        Delay3_reg[1] <= 18'sb000000000000000000;
        Delay3_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay3_bypass_delay[0] <= Delay3_bypass_delay_next[0];
          Delay3_bypass_delay[1] <= Delay3_bypass_delay_next[1];
          Delay3_bypass_delay[2] <= Delay3_bypass_delay_next[2];
          Delay3_reg[0] <= Delay3_reg_next[0];
          Delay3_reg[1] <= Delay3_reg_next[1];
          Delay3_reg[2] <= Delay3_reg_next[2];
        end
      end
    end

  assign Delay3_out1[0] = (valid == 1'b1 ? Delay3_reg[0] :
              Delay3_bypass_delay[0]);
  assign Delay3_out1[1] = (valid == 1'b1 ? Delay3_reg[1] :
              Delay3_bypass_delay[1]);
  assign Delay3_out1[2] = (valid == 1'b1 ? Delay3_reg[2] :
              Delay3_bypass_delay[2]);
  assign Delay3_bypass_delay_next[0] = Delay3_reg[0];
  assign Delay3_bypass_delay_next[1] = Delay3_reg[1];
  assign Delay3_bypass_delay_next[2] = Delay3_reg[2];
  assign Delay3_reg_next[0] = RGB7[0];
  assign Delay3_reg_next[1] = RGB7[1];
  assign Delay3_reg_next[2] = RGB7[2];



  assign RGB6[0] = RGB6_0;
  assign RGB6[1] = RGB6_1;
  assign RGB6[2] = RGB6_2;

  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_bypass_delay[0] <= 18'sb000000000000000000;
        Delay6_bypass_delay[1] <= 18'sb000000000000000000;
        Delay6_bypass_delay[2] <= 18'sb000000000000000000;
        Delay6_reg[0] <= 18'sb000000000000000000;
        Delay6_reg[1] <= 18'sb000000000000000000;
        Delay6_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay6_bypass_delay[0] <= Delay6_bypass_delay_next[0];
          Delay6_bypass_delay[1] <= Delay6_bypass_delay_next[1];
          Delay6_bypass_delay[2] <= Delay6_bypass_delay_next[2];
          Delay6_reg[0] <= Delay6_reg_next[0];
          Delay6_reg[1] <= Delay6_reg_next[1];
          Delay6_reg[2] <= Delay6_reg_next[2];
        end
      end
    end

  assign Delay6_out1[0] = (valid == 1'b1 ? Delay6_reg[0] :
              Delay6_bypass_delay[0]);
  assign Delay6_out1[1] = (valid == 1'b1 ? Delay6_reg[1] :
              Delay6_bypass_delay[1]);
  assign Delay6_out1[2] = (valid == 1'b1 ? Delay6_reg[2] :
              Delay6_bypass_delay[2]);
  assign Delay6_bypass_delay_next[0] = Delay6_reg[0];
  assign Delay6_bypass_delay_next[1] = Delay6_reg[1];
  assign Delay6_bypass_delay_next[2] = Delay6_reg[2];
  assign Delay6_reg_next[0] = RGB6[0];
  assign Delay6_reg_next[1] = RGB6[1];
  assign Delay6_reg_next[2] = RGB6[2];



  assign RGB5[0] = RGB5_0;
  assign RGB5[1] = RGB5_1;
  assign RGB5[2] = RGB5_2;

  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_bypass_delay[0] <= 18'sb000000000000000000;
        Delay7_bypass_delay[1] <= 18'sb000000000000000000;
        Delay7_bypass_delay[2] <= 18'sb000000000000000000;
        Delay7_reg[0] <= 18'sb000000000000000000;
        Delay7_reg[1] <= 18'sb000000000000000000;
        Delay7_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay7_bypass_delay[0] <= Delay7_bypass_delay_next[0];
          Delay7_bypass_delay[1] <= Delay7_bypass_delay_next[1];
          Delay7_bypass_delay[2] <= Delay7_bypass_delay_next[2];
          Delay7_reg[0] <= Delay7_reg_next[0];
          Delay7_reg[1] <= Delay7_reg_next[1];
          Delay7_reg[2] <= Delay7_reg_next[2];
        end
      end
    end

  assign Delay7_out1[0] = (valid == 1'b1 ? Delay7_reg[0] :
              Delay7_bypass_delay[0]);
  assign Delay7_out1[1] = (valid == 1'b1 ? Delay7_reg[1] :
              Delay7_bypass_delay[1]);
  assign Delay7_out1[2] = (valid == 1'b1 ? Delay7_reg[2] :
              Delay7_bypass_delay[2]);
  assign Delay7_bypass_delay_next[0] = Delay7_reg[0];
  assign Delay7_bypass_delay_next[1] = Delay7_reg[1];
  assign Delay7_bypass_delay_next[2] = Delay7_reg[2];
  assign Delay7_reg_next[0] = RGB5[0];
  assign Delay7_reg_next[1] = RGB5[1];
  assign Delay7_reg_next[2] = RGB5[2];



  assign RGB4[0] = RGB4_0;
  assign RGB4[1] = RGB4_1;
  assign RGB4[2] = RGB4_2;

  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_bypass_delay[0] <= 18'sb000000000000000000;
        Delay2_bypass_delay[1] <= 18'sb000000000000000000;
        Delay2_bypass_delay[2] <= 18'sb000000000000000000;
        Delay2_reg[0] <= 18'sb000000000000000000;
        Delay2_reg[1] <= 18'sb000000000000000000;
        Delay2_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay2_bypass_delay[0] <= Delay2_bypass_delay_next[0];
          Delay2_bypass_delay[1] <= Delay2_bypass_delay_next[1];
          Delay2_bypass_delay[2] <= Delay2_bypass_delay_next[2];
          Delay2_reg[0] <= Delay2_reg_next[0];
          Delay2_reg[1] <= Delay2_reg_next[1];
          Delay2_reg[2] <= Delay2_reg_next[2];
        end
      end
    end

  assign Delay2_out1[0] = (valid == 1'b1 ? Delay2_reg[0] :
              Delay2_bypass_delay[0]);
  assign Delay2_out1[1] = (valid == 1'b1 ? Delay2_reg[1] :
              Delay2_bypass_delay[1]);
  assign Delay2_out1[2] = (valid == 1'b1 ? Delay2_reg[2] :
              Delay2_bypass_delay[2]);
  assign Delay2_bypass_delay_next[0] = Delay2_reg[0];
  assign Delay2_bypass_delay_next[1] = Delay2_reg[1];
  assign Delay2_bypass_delay_next[2] = Delay2_reg[2];
  assign Delay2_reg_next[0] = RGB4[0];
  assign Delay2_reg_next[1] = RGB4[1];
  assign Delay2_reg_next[2] = RGB4[2];



  assign RGB3[0] = RGB3_0;
  assign RGB3[1] = RGB3_1;
  assign RGB3[2] = RGB3_2;

  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_bypass_delay[0] <= 18'sb000000000000000000;
        Delay5_bypass_delay[1] <= 18'sb000000000000000000;
        Delay5_bypass_delay[2] <= 18'sb000000000000000000;
        Delay5_reg[0] <= 18'sb000000000000000000;
        Delay5_reg[1] <= 18'sb000000000000000000;
        Delay5_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay5_bypass_delay[0] <= Delay5_bypass_delay_next[0];
          Delay5_bypass_delay[1] <= Delay5_bypass_delay_next[1];
          Delay5_bypass_delay[2] <= Delay5_bypass_delay_next[2];
          Delay5_reg[0] <= Delay5_reg_next[0];
          Delay5_reg[1] <= Delay5_reg_next[1];
          Delay5_reg[2] <= Delay5_reg_next[2];
        end
      end
    end

  assign Delay5_out1[0] = (valid == 1'b1 ? Delay5_reg[0] :
              Delay5_bypass_delay[0]);
  assign Delay5_out1[1] = (valid == 1'b1 ? Delay5_reg[1] :
              Delay5_bypass_delay[1]);
  assign Delay5_out1[2] = (valid == 1'b1 ? Delay5_reg[2] :
              Delay5_bypass_delay[2]);
  assign Delay5_bypass_delay_next[0] = Delay5_reg[0];
  assign Delay5_bypass_delay_next[1] = Delay5_reg[1];
  assign Delay5_bypass_delay_next[2] = Delay5_reg[2];
  assign Delay5_reg_next[0] = RGB3[0];
  assign Delay5_reg_next[1] = RGB3[1];
  assign Delay5_reg_next[2] = RGB3[2];



  assign RGB2[0] = RGB2_0;
  assign RGB2[1] = RGB2_1;
  assign RGB2[2] = RGB2_2;

  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_bypass_delay[0] <= 18'sb000000000000000000;
        Delay4_bypass_delay[1] <= 18'sb000000000000000000;
        Delay4_bypass_delay[2] <= 18'sb000000000000000000;
        Delay4_reg[0] <= 18'sb000000000000000000;
        Delay4_reg[1] <= 18'sb000000000000000000;
        Delay4_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay4_bypass_delay[0] <= Delay4_bypass_delay_next[0];
          Delay4_bypass_delay[1] <= Delay4_bypass_delay_next[1];
          Delay4_bypass_delay[2] <= Delay4_bypass_delay_next[2];
          Delay4_reg[0] <= Delay4_reg_next[0];
          Delay4_reg[1] <= Delay4_reg_next[1];
          Delay4_reg[2] <= Delay4_reg_next[2];
        end
      end
    end

  assign Delay4_out1[0] = (valid == 1'b1 ? Delay4_reg[0] :
              Delay4_bypass_delay[0]);
  assign Delay4_out1[1] = (valid == 1'b1 ? Delay4_reg[1] :
              Delay4_bypass_delay[1]);
  assign Delay4_out1[2] = (valid == 1'b1 ? Delay4_reg[2] :
              Delay4_bypass_delay[2]);
  assign Delay4_bypass_delay_next[0] = Delay4_reg[0];
  assign Delay4_bypass_delay_next[1] = Delay4_reg[1];
  assign Delay4_bypass_delay_next[2] = Delay4_reg[2];
  assign Delay4_reg_next[0] = RGB2[0];
  assign Delay4_reg_next[1] = RGB2[1];
  assign Delay4_reg_next[2] = RGB2[2];



  assign RGB1[0] = RGB1_0;
  assign RGB1[1] = RGB1_1;
  assign RGB1[2] = RGB1_2;

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_bypass_delay[0] <= 18'sb000000000000000000;
        Delay1_bypass_delay[1] <= 18'sb000000000000000000;
        Delay1_bypass_delay[2] <= 18'sb000000000000000000;
        Delay1_reg[0] <= 18'sb000000000000000000;
        Delay1_reg[1] <= 18'sb000000000000000000;
        Delay1_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay1_bypass_delay[0] <= Delay1_bypass_delay_next[0];
          Delay1_bypass_delay[1] <= Delay1_bypass_delay_next[1];
          Delay1_bypass_delay[2] <= Delay1_bypass_delay_next[2];
          Delay1_reg[0] <= Delay1_reg_next[0];
          Delay1_reg[1] <= Delay1_reg_next[1];
          Delay1_reg[2] <= Delay1_reg_next[2];
        end
      end
    end

  assign Delay1_out1[0] = (valid == 1'b1 ? Delay1_reg[0] :
              Delay1_bypass_delay[0]);
  assign Delay1_out1[1] = (valid == 1'b1 ? Delay1_reg[1] :
              Delay1_bypass_delay[1]);
  assign Delay1_out1[2] = (valid == 1'b1 ? Delay1_reg[2] :
              Delay1_bypass_delay[2]);
  assign Delay1_bypass_delay_next[0] = Delay1_reg[0];
  assign Delay1_bypass_delay_next[1] = Delay1_reg[1];
  assign Delay1_bypass_delay_next[2] = Delay1_reg[2];
  assign Delay1_reg_next[0] = RGB1[0];
  assign Delay1_reg_next[1] = RGB1[1];
  assign Delay1_reg_next[2] = RGB1[2];



  K_Means_ip_src_MATLAB_Function u_MATLAB_Function (.vstart(Ctrl_vStart),
                                                    .fr_num(HDL_Counter_out1),  // ufix12
                                                    .addr(K_addr),  // ufix3
                                                    .rgb_0(RGB_pixel_0),  // sfix18_En8
                                                    .rgb_1(RGB_pixel_1),  // sfix18_En8
                                                    .rgb_2(RGB_pixel_2),  // sfix18_En8
                                                    .rgb0_0(Delay_out1[0]),  // sfix18_En8
                                                    .rgb0_1(Delay_out1[1]),  // sfix18_En8
                                                    .rgb0_2(Delay_out1[2]),  // sfix18_En8
                                                    .rgb1_0(Delay1_out1[0]),  // sfix18_En8
                                                    .rgb1_1(Delay1_out1[1]),  // sfix18_En8
                                                    .rgb1_2(Delay1_out1[2]),  // sfix18_En8
                                                    .rgb2_0(Delay4_out1[0]),  // sfix18_En8
                                                    .rgb2_1(Delay4_out1[1]),  // sfix18_En8
                                                    .rgb2_2(Delay4_out1[2]),  // sfix18_En8
                                                    .rgb3_0(Delay5_out1[0]),  // sfix18_En8
                                                    .rgb3_1(Delay5_out1[1]),  // sfix18_En8
                                                    .rgb3_2(Delay5_out1[2]),  // sfix18_En8
                                                    .rgb4_0(Delay2_out1[0]),  // sfix18_En8
                                                    .rgb4_1(Delay2_out1[1]),  // sfix18_En8
                                                    .rgb4_2(Delay2_out1[2]),  // sfix18_En8
                                                    .rgb5_0(Delay7_out1[0]),  // sfix18_En8
                                                    .rgb5_1(Delay7_out1[1]),  // sfix18_En8
                                                    .rgb5_2(Delay7_out1[2]),  // sfix18_En8
                                                    .rgb6_0(Delay6_out1[0]),  // sfix18_En8
                                                    .rgb6_1(Delay6_out1[1]),  // sfix18_En8
                                                    .rgb6_2(Delay6_out1[2]),  // sfix18_En8
                                                    .rgb7_0(Delay3_out1[0]),  // sfix18_En8
                                                    .rgb7_1(Delay3_out1[1]),  // sfix18_En8
                                                    .rgb7_2(Delay3_out1[2]),  // sfix18_En8
                                                    .RGB0_0_1(RGB0_0),  // sfix18_En8
                                                    .RGB0_1_1(RGB0_1),  // sfix18_En8
                                                    .RGB0_2_1(RGB0_2),  // sfix18_En8
                                                    .RGB1_0_1(RGB1_0),  // sfix18_En8
                                                    .RGB1_1_1(RGB1_1),  // sfix18_En8
                                                    .RGB1_2_1(RGB1_2),  // sfix18_En8
                                                    .RGB2_0_1(RGB2_0),  // sfix18_En8
                                                    .RGB2_1_1(RGB2_1),  // sfix18_En8
                                                    .RGB2_2_1(RGB2_2),  // sfix18_En8
                                                    .RGB3_0_1(RGB3_0),  // sfix18_En8
                                                    .RGB3_1_1(RGB3_1),  // sfix18_En8
                                                    .RGB3_2_1(RGB3_2),  // sfix18_En8
                                                    .RGB4_0_1(RGB4_0),  // sfix18_En8
                                                    .RGB4_1_1(RGB4_1),  // sfix18_En8
                                                    .RGB4_2_1(RGB4_2),  // sfix18_En8
                                                    .RGB5_0_1(RGB5_0),  // sfix18_En8
                                                    .RGB5_1_1(RGB5_1),  // sfix18_En8
                                                    .RGB5_2_1(RGB5_2),  // sfix18_En8
                                                    .RGB6_0_1(RGB6_0),  // sfix18_En8
                                                    .RGB6_1_1(RGB6_1),  // sfix18_En8
                                                    .RGB6_2_1(RGB6_2),  // sfix18_En8
                                                    .RGB7_0_1(RGB7_0),  // sfix18_En8
                                                    .RGB7_1_1(RGB7_1),  // sfix18_En8
                                                    .RGB7_2_1(RGB7_2)  // sfix18_En8
                                                    );

  assign RGB0[0] = RGB0_0;
  assign RGB0[1] = RGB0_1;
  assign RGB0[2] = RGB0_2;

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_bypass_delay[0] <= 18'sb000000000000000000;
        Delay_bypass_delay[1] <= 18'sb000000000000000000;
        Delay_bypass_delay[2] <= 18'sb000000000000000000;
        Delay_reg[0] <= 18'sb000000000000000000;
        Delay_reg[1] <= 18'sb000000000000000000;
        Delay_reg[2] <= 18'sb000000000000000000;
      end
      else begin
        if (enb && valid) begin
          Delay_bypass_delay[0] <= Delay_bypass_delay_next[0];
          Delay_bypass_delay[1] <= Delay_bypass_delay_next[1];
          Delay_bypass_delay[2] <= Delay_bypass_delay_next[2];
          Delay_reg[0] <= Delay_reg_next[0];
          Delay_reg[1] <= Delay_reg_next[1];
          Delay_reg[2] <= Delay_reg_next[2];
        end
      end
    end

  assign Delay_out1[0] = (valid == 1'b1 ? Delay_reg[0] :
              Delay_bypass_delay[0]);
  assign Delay_out1[1] = (valid == 1'b1 ? Delay_reg[1] :
              Delay_bypass_delay[1]);
  assign Delay_out1[2] = (valid == 1'b1 ? Delay_reg[2] :
              Delay_bypass_delay[2]);
  assign Delay_bypass_delay_next[0] = Delay_reg[0];
  assign Delay_bypass_delay_next[1] = Delay_reg[1];
  assign Delay_bypass_delay_next[2] = Delay_reg[2];
  assign Delay_reg_next[0] = RGB0[0];
  assign Delay_reg_next[1] = RGB0[1];
  assign Delay_reg_next[2] = RGB0[2];



  assign K_out_0 = Delay_out1[0];

  assign K_out_1 = Delay_out1[1];

  assign K_out_2 = Delay_out1[2];

  assign K_out_3 = Delay1_out1[0];

  assign K_out_4 = Delay1_out1[1];

  assign K_out_5 = Delay1_out1[2];

  assign K_out_6 = Delay4_out1[0];

  assign K_out_7 = Delay4_out1[1];

  assign K_out_8 = Delay4_out1[2];

  assign K_out_9 = Delay5_out1[0];

  assign K_out_10 = Delay5_out1[1];

  assign K_out_11 = Delay5_out1[2];

  assign K_out_12 = Delay2_out1[0];

  assign K_out_13 = Delay2_out1[1];

  assign K_out_14 = Delay2_out1[2];

  assign K_out_15 = Delay7_out1[0];

  assign K_out_16 = Delay7_out1[1];

  assign K_out_17 = Delay7_out1[2];

  assign K_out_18 = Delay6_out1[0];

  assign K_out_19 = Delay6_out1[1];

  assign K_out_20 = Delay6_out1[2];

  assign K_out_21 = Delay3_out1[0];

  assign K_out_22 = Delay3_out1[1];

  assign K_out_23 = Delay3_out1[2];

endmodule  // K_Means_ip_src_Clustering

