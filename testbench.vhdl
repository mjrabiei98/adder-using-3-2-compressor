library ieee;
use ieee.std_logic_1164.all;

entity tb is end entity;
architecture arch of tb is
    signal in0,in1,in2,in3,in4,in5:std_logic_vector(7 downto 0);
    signal out1_linear,out2_linear:std_logic_vector(9 downto 0);
    signal out1_tree,out2_tree:std_logic_vector(9 downto 0);
begin
    u1:entity work.adder6to2(linear) port map(in0,in1,in2,in3,in4,in5,out1_linear,out2_linear);
    u2:entity work.adder6to2(adder_tree) port map(in0,in1,in2,in3,in4,in5,out1_tree,out2_tree);
    process
    begin
        in0<=x"06";
        in1<=x"10";
        in2<=x"12";
        in3<=x"03";
        in4<=x"12";
        in5<=x"11";
        WAIT FOR 50 ns;
        std.env.stop; -- or std.env.stop;
    end process;
end architecture;