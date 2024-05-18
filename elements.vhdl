
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY FA IS
    PORT(
        a,b,c     :IN STD_LOGIC;
        S            :OUT STD_LOGIC;
        CO            :OUT STD_LOGIC
        );
END ENTITY;
ARCHITECTURE behavioral OF FA IS
BEGIN
    S<=a XOR b XOR c after 5 ns;
    CO<=(a AND b) OR (b AND c) OR (a AND c) after 3 ns;
END ARCHITECTURE;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY compressor3_2 IS
    GENERIC(number_of_bits:INTEGER:=1);
    PORT(
        a,b,c      :IN STD_LOGIC_VECTOR(number_of_bits-1 DOWNTO 0);
        S          :OUT STD_LOGIC_VECTOR(number_of_bits-1 DOWNTO 0);
        COUT       :OUT STD_LOGIC_VECTOR(number_of_bits DOWNTO 0)
        );
END ENTITY;
ARCHITECTURE behavioral OF compressor3_2 IS
BEGIN
    COUT(0)<='0';
    UI:FOR I IN 0 TO number_of_bits-1 GENERATE
    BEGIN
        -- S(I)<=a(I) XOR b(I) XOR c(I);
        -- COUT(I+1)<=(a(I) AND b(I)) OR (a(I) AND c(I)) OR (b(I) AND c(I));
        FA_adder : entity work.FA(behavioral) port map(a(I), b(I), c(I), S(I), COUT(I+1));
    END GENERATE;
END ARCHITECTURE;




--------------


-- LIBRARY IEEE;
-- USE IEEE.STD_LOGIC_1164.ALL;
-- USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- ENTITY adder6to2 IS 
--         PORT(
--             op1,op2,op3,op4,op5,op6 :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--             sum  :OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
--             co   :OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
--         );
-- END ENTITY;

-- ARCHITECTURE ARC OF adder6to2 IS 
--     SIGNAl wa1,wa2,wb1      : STD_LOGIC_VECTOR(8 DOWNTO 0); 
--     SIGNAL wb3,wb2,wc,we    : STD_LOGIC_VECTOR(9 DOWNTO 0);
--     SIGNAL wf               : STD_LOGIC_VECTOR(9 DOWNTO 0);
-- BEGIN

--     wa1(8)<='0';
--     wa2(8)<='0';
--     wb1(0)<='0';
--     wb2(0)<='0';
--     wb3(0)<='0';

--     wc(9)<='0';
--     wb2(9)<='0';
--     wb3(9)<='0';
--     we(9)<='0';
--     wf(0)<='0';
   

--     u1:FOR i IN 7 DOWNTO 0 GENERATE
--         level1_FA1:ENTITY WORK.FA(arc_FA) PORT MAP(op1(i),op2(i),op3(i),wa1(i),wb1(i+1));
--         level1_FA2:ENTITY WORK.FA(arc_FA) PORT MAP(op4(i),op5(i),op6(i),wa2(i),wb2(i+1));
--     END GENERATE;

--     u2:FOR i IN 8 DOWNTO 0 GENERATE
--         level2_FA3:ENTITY WORK.FA(arc_FA) PORT MAP(wa1(i),wa2(i),wb1(i),wc(i),wb3(i+1));
--         level3_FA4:ENTITY WORK.FA(arc_FA) PORT MAP(wb2(i),wb3(i),wc(i),we(i),wf(i+1));
--     END GENERATE;

--     sum<=we;
--     co<=wf;
--     END ARCHITECTURE;

------------------------