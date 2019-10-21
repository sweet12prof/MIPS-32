library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BoardImplement is
  Port ( 
            clk : in std_logic;
				clkEn : in std_logic;
            -----Seven Segment---------
            Anode_Sel : out std_logic_vector(3 downto 0);
            SegA_G : out std_logic_vector(6 downto 0);
            memWriteLED : out std_logic
        );
end BoardImplement;

architecture Behavioral of BoardImplement is

		component DebugCounter is 
					port
					( 
						 Clock_enable_B: in std_logic;
						 Clock: in std_logic;
						 newClock : out std_logic
						 );
				end component;
    
    component Seven_Segment
        port
            (
                 clk : in std_logic;
                 SS_In1 : in std_logic_vector(7 downto 0);
                 SS_In2 : in std_logic_Vector(7 downto 0);
            
                 An_Out : out std_logic_Vector(3 downto 0);
                 SS_Out : out std_logic_Vector(6 downto 0)
            );
    end component;
    
    component top
       port
	       (
                clk, reset: in STD_LOGIC;
		        writedata, dataadr : out STD_LOGIC_VECTOR(7 downto 0);
		        memwrite : out std_logic
	       );
	  end component;
	  


	
	COMPONENT MyDCM
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;

	
Component clockDivider2
		Port (
					clk : in std_logic;
					newClk : out std_logic
				);
end component;




	  signal memwriteSig : std_logic;
	  signal writedataSig, dataadrSig : std_logic_vector(7 downto 0);
	  signal Anode_SelSig : std_logic_vector(3 downto 0);
	  signal SegA_G_Signal :  std_logic_vector(6 downto 0);
	  signal clockNew, clockNew2,  someSig,notlocked,  locked : std_logic;
begin
    
    Pp_processor : top port map
                    (
                        clk => clockNew2,
								reset => notlocked,
                        writedata => writedataSig,
                        dataadr => dataadrSig,
                        memwrite => memwriteSig
                     );
      
      Seven_Segment1 : Seven_Segment port map
                        (
                            clk => clockNew,
                            SS_In1 => writedataSig,
                            SS_In2 => dataadrSig,
                            An_Out => Anode_SelSig,
                            SS_Out  => SegA_G_Signal
                         );
								 					 
								
		  clockFix1 : DebugCounter PORT MAP
								(
										   Clock_enable_B => clkEn,
											Clock => clockNew,											
											newClock => clockNew2
								);
        
		 	Inst_MyDCM: MyDCM PORT MAP(
											CLKIN_IN => clk,
											RST_IN => someSig,
										   CLKFX_OUT => clockNew,
											CLKIN_IBUFG_OUT => open,
											CLK0_OUT => open,
											LOCKED_OUT => locked
	);





		  notlocked <= not locked;
		  Anode_Sel <=  Anode_SelSig;      
        SegA_G  <= SegA_G_Signal;
        memWriteLED <= memwriteSig;
		 		  
end Behavioral;
