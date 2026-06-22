module traffic_light_controller(

    input clk,
    input rst,

    output reg [2:0] ns_light,
    output reg [2:0] ew_light

   );

    //------------------------------------------------
    // State Encoding
    //------------------------------------------------

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    //------------------------------------------------
    // Internal Registers
    //------------------------------------------------

    reg [1:0] state;
    reg [3:0] timer;

    //------------------------------------------------
    // Sequential Logic
    //------------------------------------------------

    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin
            state <= S0;
            timer <= 0;
        end

        else
            begin

            timer <= timer + 1;

            case(state)

                //------------------------------------
                // S0
                //------------------------------------
                S0:
                begin
                    if(timer == 5)
                    begin
                        state <= S1;
                        timer <= 0;
                    end
                end

                //------------------------------------
                // S1
                //------------------------------------
                S1:
                begin
                    if(timer == 2)
                    begin
                        state <= S2;
                        timer <= 0;
                    end
                end

                //------------------------------------
                // S2
                //------------------------------------
                S2:
                begin
                    if(timer == 5)
                    begin
                        state <= S3;
                        timer <= 0;
                    end
                end

                //------------------------------------
                // S3
                //------------------------------------
                S3:
                begin
                    if(timer == 2)
                    begin
                        state <= S0;
                        timer <= 0;
                    end
                end

            endcase

        end

    end

    //------------------------------------------------
    // Output Logic
    //------------------------------------------------

    always @(*)
    begin

        case(state)

            //----------------------------------------
            // S0
            //----------------------------------------
            S0:
            begin
                ns_light = 3'b100;   // GREEN
                ew_light = 3'b001;   // RED
            end

            //----------------------------------------
            // S1
            //----------------------------------------
            S1:
            begin
                ns_light = 3'b010;   // YELLOW
                ew_light = 3'b001;   // RED
            end

            //----------------------------------------
            // S2
            //----------------------------------------
            S2:
            begin
                ns_light = 3'b001;   // RED
                ew_light = 3'b100;   // GREEN
            end

            //----------------------------------------
            // S3
            //----------------------------------------
            S3:
            begin
                ns_light = 3'b001;   // RED
                ew_light = 3'b010;   // YELLOW
            end

            //----------------------------------------
            // Default
            //----------------------------------------
            default:
            begin
                ns_light = 3'b001;
                ew_light = 3'b001;
            end

        endcase

    end

endmodule