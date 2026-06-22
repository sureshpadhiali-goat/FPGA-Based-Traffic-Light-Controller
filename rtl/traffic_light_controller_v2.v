module traffic_light_controller_v2(

    input clk,
    input rst,

    output reg [2:0] ns_light,
    output reg [2:0] ew_light

);

    //------------------------------------
    // State Encoding
    //------------------------------------

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] current_state;
    reg [1:0] next_state;

    reg [3:0] timer;

    //------------------------------------
    // State Register
    //------------------------------------

    always @(posedge clk or posedge rst)
    begin
        if(rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    //------------------------------------
    // Timer Logic
    //------------------------------------

    always @(posedge clk or posedge rst)
    begin

        if(rst)
            timer <= 0;

        else
        begin

            case(current_state)

                S0:
                    if(timer == 5)
                        timer <= 0;
                    else
                        timer <= timer + 1;

                S1:
                    if(timer == 2)
                        timer <= 0;
                    else
                        timer <= timer + 1;

                S2:
                    if(timer == 5)
                        timer <= 0;
                    else
                        timer <= timer + 1;

                S3:
                    if(timer == 2)
                        timer <= 0;
                    else
                        timer <= timer + 1;

            endcase

        end

    end

    //------------------------------------
    // Next State Logic
    //------------------------------------

    always @(*)
    begin

        next_state = current_state;

        case(current_state)

            S0:
                if(timer == 5)
                    next_state = S1;

            S1:
                if(timer == 2)
                    next_state = S2;

            S2:
                if(timer == 5)
                    next_state = S3;

            S3:
                if(timer == 2)
                    next_state = S0;

        endcase

    end

    //------------------------------------
    // Output Logic
    //------------------------------------

    always @(*)
    begin

        case(current_state)

            S0:
            begin
                ns_light = 3'b100;
                ew_light = 3'b001;
            end

            S1:
            begin
                ns_light = 3'b010;
                ew_light = 3'b001;
            end

            S2:
            begin
                ns_light = 3'b001;
                ew_light = 3'b100;
            end

            S3:
            begin
                ns_light = 3'b001;
                ew_light = 3'b010;
            end

            default:
            begin
                ns_light = 3'b001;
                ew_light = 3'b001;
            end

        endcase

    end

endmodule