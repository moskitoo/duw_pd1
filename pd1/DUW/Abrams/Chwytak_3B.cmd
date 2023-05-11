!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = cm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 1.0  &
   spacing_for_grid = 100.0
!
!------------------------------ Adams/View Model ------------------------------!
!
!
model create  &
   model_name = Chwytak
!
model attributes  &
   model_name = .Chwytak  &
   size_of_icons = 1.0
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Chwytak.steel  &
   adams_id = 1  &
   youngs_modulus = 2.07E+007  &
   poissons_ratio = 0.29  &
   density = 7.801E-003
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_14  &
   adams_id = 14  &
   location = -1.8, 2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_16  &
   adams_id = 16  &
   location = -4.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_30  &
   adams_id = 30  &
   location = -1.8, 2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_31  &
   adams_id = 31  &
   location = -4.0, 1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_32  &
   adams_id = 32  &
   location = -4.0, -1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_33  &
   adams_id = 33  &
   location = -1.8, -2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_34  &
   adams_id = 34  &
   location = -10.0, -2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_35  &
   adams_id = 35  &
   location = -10.0, 2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_43  &
   adams_id = 43  &
   location = -1.8, -2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_45  &
   adams_id = 45  &
   location = 9.0, 6.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Chwytak.ground.MARKER_47  &
   adams_id = 47  &
   location = 9.0, -6.0, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chwytak.ground  &
   material_type = .Chwytak.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .Chwytak.ground.POINT_1  &
   location = 0.0, 0.0, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_1  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_2  &
   location = 0.75, 6.5, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_2  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_3  &
   location = 9.0, 6.0, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_3  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_4  &
   location = 0.25, 7.0, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_4  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_5  &
   location = -1.8, 2.45, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_5  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_9  &
   location = 0.75, -6.5, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_9  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_10  &
   location = 9.0, -6.0, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_10  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_11  &
   location = 0.25, -7.0, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_11  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_12  &
   location = -1.8, -2.45, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_12  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_15  &
   location = -10.0, 2.45, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_15  &
   name_visibility = on
!
point create  &
   point_name = .Chwytak.ground.POINT_16  &
   location = -10.0, -2.45, 0.0
!
point attributes  &
   point_name = .Chwytak.ground.POINT_16  &
   name_visibility = on
!
! ****** Graphics for current part ******
!
geometry create shape plate  &
   plate_name = .Chwytak.ground.PLATE_17  &
   marker_name = .Chwytak.ground.MARKER_30, .Chwytak.ground.MARKER_31,  &
                 .Chwytak.ground.MARKER_32, .Chwytak.ground.MARKER_33,  &
                 .Chwytak.ground.MARKER_34, .Chwytak.ground.MARKER_35  &
   width = 2.0  &
   radius = 0.5
!
geometry attributes  &
   geometry_name = .Chwytak.ground.PLATE_17  &
   color = SILVER
!
part attributes  &
   part_name = .Chwytak.ground  &
   color = GREEN  &
   name_visibility = off  &
   size_of_icons = 1.0
!
!----------------------------------- Suwak ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
part create rigid_body name_and_position  &
   part_name = .Chwytak.Suwak  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.Suwak
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chwytak.Suwak.MARKER_1  &
   adams_id = 1  &
   location = -8.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.Suwak.MARKER_2  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.Suwak.cm  &
   adams_id = 17  &
   location = -4.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Chwytak.Suwak.MARKER_10  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.Suwak.MARKER_15  &
   adams_id = 15  &
   location = -4.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Chwytak.Suwak.MARKER_39  &
   adams_id = 39  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chwytak.Suwak  &
   material_type = .Chwytak.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chwytak.Suwak.LINK_6  &
   i_marker = .Chwytak.Suwak.MARKER_1  &
   j_marker = .Chwytak.Suwak.MARKER_2  &
   width = 1.0  &
   depth = 0.5
!
part attributes  &
   part_name = .Chwytak.Suwak  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- PalecG -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
part create rigid_body name_and_position  &
   part_name = .Chwytak.PalecG  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.PalecG
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chwytak.PalecG.MARKER_3  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.MARKER_4  &
   adams_id = 4  &
   location = 0.75, 6.5, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.KG  &
   adams_id = 5  &
   location = 9.0, 6.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.MARKER_6  &
   adams_id = 6  &
   location = 0.25, 7.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.cm  &
   adams_id = 18  &
   location = 2.652120471, 5.0696298986, 0.0  &
   orientation = 296.9652372425d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.MARKER_9  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.MARKER_12  &
   adams_id = 12  &
   location = 0.25, 7.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecG.MARKER_44  &
   adams_id = 44  &
   location = 9.0, 6.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Chwytak.PalecG  &
   material_type = .Chwytak.steel
!
! ****** Graphics for current part ******
!
geometry create shape plate  &
   plate_name = .Chwytak.PalecG.PLATE_7  &
   marker_name = .Chwytak.PalecG.MARKER_3, .Chwytak.PalecG.MARKER_4,  &
                 .Chwytak.PalecG.KG, .Chwytak.PalecG.MARKER_6  &
   width = 1.0  &
   radius = 0.5
!
part attributes  &
   part_name = .Chwytak.PalecG  &
   color = MAGENTA  &
   name_visibility = off
!
!---------------------------------- LacznikG ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
part create rigid_body name_and_position  &
   part_name = .Chwytak.LacznikG  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.LacznikG
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chwytak.LacznikG.MARKER_7  &
   adams_id = 7  &
   location = -1.8, 2.45, 0.0  &
   orientation = 65.7460802757d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.LacznikG.MARKER_8  &
   adams_id = 8  &
   location = 0.25, 7.0, 0.0  &
   orientation = 65.7460802757d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.LacznikG.cm  &
   adams_id = 19  &
   location = -0.775, 4.725, 0.0  &
   orientation = 155.7460802757d, 89.9999999787d, 89.999999862d
!
marker create  &
   marker_name = .Chwytak.LacznikG.MARKER_11  &
   adams_id = 11  &
   location = 0.25, 7.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.LacznikG.MARKER_13  &
   adams_id = 13  &
   location = -1.8, 2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chwytak.LacznikG  &
   material_type = .Chwytak.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chwytak.LacznikG.LINK_8  &
   i_marker = .Chwytak.LacznikG.MARKER_7  &
   j_marker = .Chwytak.LacznikG.MARKER_8  &
   width = 1.0  &
   depth = 0.5
!
part attributes  &
   part_name = .Chwytak.LacznikG  &
   color = MAIZE  &
   name_visibility = off
!
!----------------------------------- PalecD -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
part create rigid_body name_and_position  &
   part_name = .Chwytak.PalecD  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.PalecD
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chwytak.PalecD.MARKER_20  &
   adams_id = 20  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.MARKER_21  &
   adams_id = 21  &
   location = 0.75, -6.5, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.KD  &
   adams_id = 22  &
   location = 9.0, -6.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.MARKER_23  &
   adams_id = 23  &
   location = 0.25, -7.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.cm  &
   adams_id = 36  &
   location = 2.652120471, -5.0696298986, 0.0  &
   orientation = 243.0347627575d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.MARKER_38  &
   adams_id = 38  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.MARKER_41  &
   adams_id = 41  &
   location = 0.25, -7.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.PalecD.MARKER_46  &
   adams_id = 46  &
   location = 9.0, -6.0, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chwytak.PalecD  &
   material_type = .Chwytak.steel
!
! ****** Graphics for current part ******
!
geometry create shape plate  &
   plate_name = .Chwytak.PalecD.PLATE_13  &
   marker_name = .Chwytak.PalecD.MARKER_20, .Chwytak.PalecD.MARKER_21,  &
                 .Chwytak.PalecD.KD, .Chwytak.PalecD.MARKER_23  &
   width = 1.0  &
   radius = 0.5
!
part attributes  &
   part_name = .Chwytak.PalecD  &
   color = MAGENTA  &
   name_visibility = off
!
!---------------------------------- LacznikD ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
part create rigid_body name_and_position  &
   part_name = .Chwytak.LacznikD  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.LacznikD
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chwytak.LacznikD.MARKER_24  &
   adams_id = 24  &
   location = -1.8, -2.45, 0.0  &
   orientation = 294.2539197243d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.LacznikD.MARKER_25  &
   adams_id = 25  &
   location = 0.25, -7.0, 0.0  &
   orientation = 294.2539197243d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.LacznikD.cm  &
   adams_id = 37  &
   location = -0.775, -4.725, 0.0  &
   orientation = 204.2539197243d, 90.0000000213d, 90.000000138d
!
marker create  &
   marker_name = .Chwytak.LacznikD.MARKER_40  &
   adams_id = 40  &
   location = 0.25, -7.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chwytak.LacznikD.MARKER_42  &
   adams_id = 42  &
   location = -1.8, -2.45, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chwytak.LacznikD  &
   material_type = .Chwytak.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chwytak.LacznikD.LINK_14  &
   i_marker = .Chwytak.LacznikD.MARKER_24  &
   j_marker = .Chwytak.LacznikD.MARKER_25  &
   width = 1.0  &
   depth = 0.5
!
part attributes  &
   part_name = .Chwytak.LacznikD  &
   color = MAIZE  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .Chwytak.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Chwytak.PalecG.MARKER_9  &
   j_marker_name = .Chwytak.Suwak.MARKER_10
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Chwytak.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Chwytak.LacznikG.MARKER_11  &
   j_marker_name = .Chwytak.PalecG.MARKER_12
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Chwytak.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Chwytak.LacznikG.MARKER_13  &
   j_marker_name = .Chwytak.ground.MARKER_14
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_3  &
   name_visibility = off
!
constraint create joint translational  &
   joint_name = .Chwytak.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Chwytak.Suwak.MARKER_15  &
   j_marker_name = .Chwytak.ground.MARKER_16
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_4  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Chwytak.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .Chwytak.PalecD.MARKER_38  &
   j_marker_name = .Chwytak.Suwak.MARKER_39
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_5  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Chwytak.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .Chwytak.LacznikD.MARKER_40  &
   j_marker_name = .Chwytak.PalecD.MARKER_41
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_6  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Chwytak.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .Chwytak.LacznikD.MARKER_42  &
   j_marker_name = .Chwytak.ground.MARKER_43
!
constraint attributes  &
   constraint_name = .Chwytak.JOINT_7  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create direct single_component_force  &
   single_component_force_name = .Chwytak.SFORCE_1  &
   adams_id = 1  &
   type_of_freedom = translational  &
   i_marker_name = .Chwytak.PalecG.MARKER_44  &
   j_marker_name = .Chwytak.ground.MARKER_45  &
   action_only = on  &
   function = ""
!
force create direct single_component_force  &
   single_component_force_name = .Chwytak.SFORCE_2  &
   adams_id = 2  &
   type_of_freedom = translational  &
   i_marker_name = .Chwytak.PalecD.MARKER_46  &
   j_marker_name = .Chwytak.ground.MARKER_47  &
   action_only = on  &
   function = ""
!
!---------------------------------- Sensors -----------------------------------!
!
!
executive_control create sensor  &
   sensor_name = .Chwytak.SENSOR_1  &
   adams_id = 1  &
   bisection = on  &
   time_error = 1.0E-006  &
   compare = le  &
   value = 4.0  &
   error = 0.001  &
   codgen = off  &
   halt = on  &
   print = on  &
   restart = off  &
   return = off  &
   yydump = off  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Chwytak.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=100.0 number_of_steps=100 model_name=.Chwytak"
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
geometry create shape force  &
   force_name = .Chwytak.SFORCE_1_force_graphic_1  &
   adams_id = 1  &
   force_element_name = .Chwytak.SFORCE_1  &
   applied_at_marker_name = .Chwytak.PalecG.MARKER_44
!
geometry create shape force  &
   force_name = .Chwytak.SFORCE_2_force_graphic_1  &
   adams_id = 2  &
   force_element_name = .Chwytak.SFORCE_2  &
   applied_at_marker_name = .Chwytak.PalecD.MARKER_46
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Chwytak.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = translational  &
   joint_name = .Chwytak.JOINT_4  &
   function = ""
!
constraint attributes  &
   constraint_name = .Chwytak.MOTION_1  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = 0.0  &
   z_component_gravity = 0.0
!
force attributes  &
   force_name = .Chwytak.gravity  &
   visibility = off  &
   size_of_icons = 1.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .Chwytak.Naped  &
   from_first = yes  &
   object = .Chwytak.MOTION_1  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Chwytak.Naped  &
   color = WHITE
!
measure create point  &
   measure_name = .Chwytak.KG_x  &
   point = .Chwytak.PalecG.KG  &
   characteristic = translational_displacement  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Chwytak.KG_x  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .Chwytak.Dystans  &
   from_point = .Chwytak.PalecD.KD  &
   to_point = .Chwytak.PalecG.KG  &
   characteristic = translational_displacement  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Chwytak.Dystans  &
   color = WHITE
!
measure create function  &
   measure_name = .Chwytak.Odchylenie  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Chwytak.Odchylenie  &
   color = WHITE
!
!---------------------------- Adams/View Variables ----------------------------!
!
!
variable create  &
   variable_name = .Chwytak.layout_config  &
   integer_value = 1
!
variable create  &
   variable_name = .Chwytak.DV_1  &
   range = 0.0, 4.0  &
   real_value = 2.0
!
variable create  &
   variable_name = .Chwytak.DV_2  &
   units = "no_units"  &
   range = 4.0, 7.0  &
   use_allowed_values = no  &
   real_value = 4.0
!
variable create  &
   variable_name = .Chwytak.DV_3  &
   units = "no_units"  &
   range = -5.0, -1.0  &
   use_allowed_values = no  &
   real_value = -3.0
!
variable create  &
   variable_name = .Chwytak.DV_4  &
   units = "no_units"  &
   range = 1.0, 4.0  &
   use_allowed_values = no  &
   real_value = 4.0
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Chwytak.MOTION_1  &
   function = "0.02 * time"
!
measure modify function  &
   measure_name = .Chwytak.Odchylenie  &
   function = "ABS(.Chwytak.KG_x - 9.0)"
!
force modify direct single_component_force  &
   single_component_force_name = .Chwytak.SFORCE_1  &
   function = "1.0"
!
force modify direct single_component_force  &
   single_component_force_name = .Chwytak.SFORCE_2  &
   function = "1.0"
!
executive_control modify sensor  &
   sensor_name = .Chwytak.SENSOR_1  &
   function = ".Chwytak.Dystans"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_14  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_5))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_30  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_5))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_33  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_12))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_34  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_16))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_35  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_15))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_43  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_12))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_45  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_3))
!
marker modify  &
   marker_name = .Chwytak.ground.MARKER_47  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_10))
!
point modify  &
   point_name = .Chwytak.ground.POINT_2  &
   location =   &
      (.Chwytak.DV_1 + 0.5),  &
      (.Chwytak.DV_2 - 0.5),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_4  &
   location =   &
      (.Chwytak.DV_1),  &
      (.Chwytak.DV_2),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_5  &
   location =   &
      (.Chwytak.DV_3),  &
      (.Chwytak.DV_4),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_9  &
   location =   &
      (.Chwytak.DV_1 + 0.5),  &
      (-.Chwytak.DV_2 + 0.5),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_11  &
   location =   &
      (.Chwytak.DV_1),  &
      (-.Chwytak.DV_2),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_12  &
   location =   &
      (.Chwytak.DV_3),  &
      (-.Chwytak.DV_4),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_15  &
   location =   &
      -10.0,  &
      (.Chwytak.DV_4),  &
      0.0
!
point modify  &
   point_name = .Chwytak.ground.POINT_16  &
   location =   &
      -10.0,  &
      (-.Chwytak.DV_4),  &
      0.0
!
geometry modify shape plate  &
   plate_name = .Chwytak.ground.PLATE_17  &
   width = (2.0cm)  &
   radius = (0.5cm)
!
material modify  &
   material_name = .Chwytak.steel  &
   youngs_modulus = (2.07E+011(Newton/meter**2))  &
   density = (7801.0(kg/meter**3))
!
marker modify  &
   marker_name = .Chwytak.Suwak.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.Suwak
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.Suwak.MARKER_10  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.Suwak
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.Suwak.MARKER_39  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.Suwak
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
geometry modify shape link  &
   link_name = .Chwytak.Suwak.LINK_6  &
   width = (1.0cm)  &
   depth = (0.5cm)
!
marker modify  &
   marker_name = .Chwytak.PalecG.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecG.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_2))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecG.KG  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_3))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecG.MARKER_6  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_4))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecG.MARKER_9  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecG.MARKER_12  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_4))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecG.MARKER_44  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_3))  &
   relative_to = .Chwytak.PalecG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
geometry modify shape plate  &
   plate_name = .Chwytak.PalecG.PLATE_7  &
   width = (1.0cm)  &
   radius = (0.5cm)
!
marker modify  &
   marker_name = .Chwytak.LacznikG.MARKER_7  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_5))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Chwytak.ground.POINT_5, .Chwytak.ground.POINT_4, "X"))  &
   relative_to = .Chwytak.LacznikG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.LacznikG.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_4))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Chwytak.ground.POINT_5, .Chwytak.ground.POINT_4, "X"))  &
   relative_to = .Chwytak.LacznikG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.LacznikG.MARKER_11  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_4))  &
   relative_to = .Chwytak.LacznikG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.LacznikG.MARKER_13  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_5))  &
   relative_to = .Chwytak.LacznikG
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
geometry modify shape link  &
   link_name = .Chwytak.LacznikG.LINK_8  &
   width = (1.0cm)  &
   depth = (0.5cm)
!
marker modify  &
   marker_name = .Chwytak.PalecD.MARKER_20  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecD.MARKER_21  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_9))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecD.KD  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_10))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecD.MARKER_23  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_11))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecD.MARKER_38  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_1))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecD.MARKER_41  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_11))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.PalecD.MARKER_46  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_10))  &
   relative_to = .Chwytak.PalecD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
geometry modify shape plate  &
   plate_name = .Chwytak.PalecD.PLATE_13  &
   width = (1.0cm)  &
   radius = (0.5cm)
!
marker modify  &
   marker_name = .Chwytak.LacznikD.MARKER_24  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_12))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Chwytak.ground.POINT_12, .Chwytak.ground.POINT_11, "X"))  &
   relative_to = .Chwytak.LacznikD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.LacznikD.MARKER_25  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_11))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Chwytak.ground.POINT_12, .Chwytak.ground.POINT_11, "X"))  &
   relative_to = .Chwytak.LacznikD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.LacznikD.MARKER_40  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_11))  &
   relative_to = .Chwytak.LacznikD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
marker modify  &
   marker_name = .Chwytak.LacznikD.MARKER_42  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chwytak.ground.POINT_12))  &
   relative_to = .Chwytak.LacznikD
!
defaults coordinate_system  &
   default_coordinate_system = .Chwytak.ground
!
geometry modify shape link  &
   link_name = .Chwytak.LacznikD.LINK_14  &
   width = (1.0cm)  &
   depth = (0.5cm)
!
geometry modify shape force  &
   force_name = .Chwytak.SFORCE_1_force_graphic_1  &
   applied_at_marker_name = (.Chwytak.SFORCE_1.i)
!
geometry modify shape force  &
   force_name = .Chwytak.SFORCE_2_force_graphic_1  &
   applied_at_marker_name = (.Chwytak.SFORCE_2.i)
!



!======================================= Rysowanie wykresow przed optymaliazcja =========================!

simulation single trans type = auto_select end_time = 100 number_of_steps = 100

xy_plot template modify plot=.plot_1 auto_title=yes auto_subtitle=yes auto_date=yes auto_analysis_name=yes table=no
xy_plot curve create curve=.plot_1.curve_1 create_page=no calculate_axis_limits=no dmeasure=.Chwytak.Naped run=.Chwytak.Last_Run auto_axis=UNITS
xy_plot template calculate_axis_limits plot_name=.plot_1

xy axis mod axis=.plot_1.haxis label="Czas [s]"
note att note_name=.plot_1.haxis.axis_label point_size=12

xy axis mod axis=.plot_1.vaxis label="Sila [N]"
note att note_name=plot_1.vaxis.axis_label point_size=12
xy axis mod axis=.plot_1.haxis autoscale=no lim=0.0, 75.0
xy axis mod axis=.plot_1.haxis divs=5
xy axis mod axis=.plot_1.haxis minor_divs=2

xy curve mod curve=.plot_1.curve_1 legend="Sila napedowa"
xy curve mod curve=.plot_1.curve_1 color=Black
xy curve mod curve=.plot_1.curve_1 line_type=Dot
xy curve mod curve=.plot_1.curve_1 thickness=3.0

xy_plot template modify plot=.plot_1 title="Wykres sily i predkosci"
note att note_name=.plot_1.title point_size=15

xy_plot curve create curve=.plot_1.curve_2 create_page=no calculate_axis_limits=no dexpression="MEASURE(.Chwytak.PalecG.KG, 0, 0, Translational_Velocity,  Y_component)" legend=".KG.Translational_Velocity.Y"  d_units = "velocity" run=.Chwytak.Last_Run auto_axis=UNITS
xy_plot template calculate_axis_limits plot_name=.plot_1

xy axis mod axis=.plot_1.vaxis_1 label="Predkosc [cm/s]"
note att note_name=plot_1.vaxis_1.axis_label point_size=12
xy axis mod axis=.plot_1.haxis autoscale=no lim=0.0, 75.0
xy curve mod curve=.plot_1.curve_2 legend="Predkosc zacisku"
xy curve mod curve=.plot_1.curve_2 thickness=1.5


interface plot window create_new_page default_layout=yes

xy_plot template modify plot=.plot_2 auto_title=yes auto_subtitle=no auto_date=yes auto_analysis_name=yes table=no
xy_plot curve create curve=.plot_2.curve_1 create_page=no calculate_axis_limits=no dexpression="MEASURE(.Chwytak.PalecG.KG, 0, 0, Translational_Displacement,  Y_component)" iexpression="MEASURE(.Chwytak.PalecG.KG, 0, 0, Translational_Displacement,  X_component)" i_units = "length" legend=".KG.Translational_Displacement.Y"  d_units = "length" run=.Chwytak.Last_Run auto_axis=UNITS
xy_plot template calculate_axis_limits plot_name=.plot_2

xy curve mod curve=.plot_2.curve_1 legend="Trajektoria"
xy curve mod curve=.plot_2.curve_1 thickness=4.0

xy axis mod axis=.plot_2.vaxis label="Wspolrzedna Y [cm]"
note att note_name=.plot_2.vaxis.axis_label point_size=12

xy axis mod axis=.plot_2.haxis label="Wspolrzedna X [cm]"
note att note_name=.plot_2.haxis.axis_label point_size=12
xy axis mod axis=.plot_2.haxis autoscale=no lim=7.0, 11.0
xy axis mod axis=.plot_2.haxis divs=4

xy_plot template modify plot=.plot_2 title="Trajektoria punktu KG"
note att note_name=.plot_2.title point_size=15

interface field set field=message strings="" action=replace
interface dialog undisplay dialog=.gui.msg_box



interface grid modify &
   extent      = 15,15 &
   spacing     = 1,1
interface grid display

model display  &
   model_name = Chwytak



!================================================== Zmiany modelu po optymalziacji ==================================!
!
!---------------------------- Adams/View Variables ----------------------------!
!
!
variable modify &
   variable_name = .Chwytak.layout_config  &
   integer_value = 1
!
variable modify  &
   variable_name = .Chwytak.DV_1  &
   range = 0.0, 4.0  &
   real_value = 0.25
!
variable modify  &
   variable_name = .Chwytak.DV_2  &
   units = "no_units"  &
   range = 4.0, 7.0  &
   use_allowed_values = no  &
   real_value = 7.0
!
variable modify  &
   variable_name = .Chwytak.DV_3  &
   units = "no_units"  &
   range = -5.0, -1.0  &
   use_allowed_values = no  &
   real_value = -1.8
!
variable modify  &
   variable_name = .Chwytak.DV_4  &
   units = "no_units"  &
   range = 1.0, 4.0  &
   use_allowed_values = no  &
   real_value = 2.45
!

model display  &
   model_name = Chwytak



!======================================= Rysowanie wykresu po optymaliazcji ============================!

simulation single reset
simulation single trans type = auto_select end_time = 100 number_of_steps = 100

xy_plot curve create curve=.plot_2.curve_2 create_page=no calculate_axis_limits=no dexpression="MEASURE(.Chwytak.PalecG.KG, 0, 0, Translational_Displacement,  Y_component)" iexpression="MEASURE(.Chwytak.PalecG.KG, 0, 0, Translational_Displacement,  X_component)" i_units = "length" legend=".KG.Translational_Displacement.Y"  d_units = "length" run=.Chwytak.Last_Run auto_axis=UNITS
xy curve mod curve=.plot_2.curve_2 legend="Trajektoria zoptymalizowana"

interface field set field=message strings="" action=replace
interface dialog undisplay dialog=.gui.msg_box
