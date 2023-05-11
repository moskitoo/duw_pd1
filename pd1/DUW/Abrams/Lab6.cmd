!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
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
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Lab6
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Lab6.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
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
   default_coordinate_system = .Lab6.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Lab6.ground.MARKER_8  &
   adams_id = 8  &
   location = -400.0, -200.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.ground.MARKER_14  &
   adams_id = 14  &
   location = 350.0, -200.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Lab6.ground  &
   material_type = .Lab6.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .Lab6.ground.A  &
   location = -400.0, -200.0, 0.0
!
point create  &
   point_name = .Lab6.ground.B  &
   location = -400.0, 100.0, 0.0
!
point create  &
   point_name = .Lab6.ground.C  &
   location = 300.0, 300.0, 0.0
!
point create  &
   point_name = .Lab6.ground.D  &
   location = 350.0, -200.0, 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Lab6.ground  &
   name_visibility = off
!
!----------------------------------- PART_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
part create rigid_body name_and_position  &
   part_name = .Lab6.PART_2  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.PART_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Lab6.PART_2.MARKER_1  &
   adams_id = 1  &
   location = -400.0, -200.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_2.MARKER_2  &
   adams_id = 2  &
   location = -400.0, 100.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_2.cm  &
   adams_id = 15  &
   location = -400.0, -50.0, 0.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Lab6.PART_2.MARKER_7  &
   adams_id = 7  &
   location = -400.0, -200.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_2.MARKER_9  &
   adams_id = 9  &
   location = -400.0, 100.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Lab6.PART_2  &
   material_type = .Lab6.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Lab6.PART_2.LINK_5  &
   i_marker = .Lab6.PART_2.MARKER_1  &
   j_marker = .Lab6.PART_2.MARKER_2  &
   width = 40.0  &
   depth = 20.0
!
part attributes  &
   part_name = .Lab6.PART_2  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- PART_3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
part create rigid_body name_and_position  &
   part_name = .Lab6.PART_3  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.PART_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Lab6.PART_3.MARKER_3  &
   adams_id = 3  &
   location = -400.0, 100.0, 0.0  &
   orientation = 15.9453959009d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_3.MARKER_4  &
   adams_id = 4  &
   location = 300.0, 300.0, 0.0  &
   orientation = 15.9453959009d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_3.cm  &
   adams_id = 16  &
   location = -50.0, 200.0, 0.0  &
   orientation = 285.9453959009d, 90.0000000057d, 90.0000001305d
!
marker create  &
   marker_name = .Lab6.PART_3.MARKER_10  &
   adams_id = 10  &
   location = -400.0, 100.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_3.MARKER_11  &
   adams_id = 11  &
   location = 300.0, 300.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Lab6.PART_3  &
   material_type = .Lab6.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Lab6.PART_3.LINK_6  &
   i_marker = .Lab6.PART_3.MARKER_3  &
   j_marker = .Lab6.PART_3.MARKER_4  &
   width = 40.0  &
   depth = 20.0
!
part attributes  &
   part_name = .Lab6.PART_3  &
   color = GREEN  &
   name_visibility = off
!
!----------------------------------- PART_4 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
part create rigid_body name_and_position  &
   part_name = .Lab6.PART_4  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.PART_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Lab6.PART_4.MARKER_5  &
   adams_id = 5  &
   location = 300.0, 300.0, 0.0  &
   orientation = 275.7105931375d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_4.MARKER_6  &
   adams_id = 6  &
   location = 350.0, -200.0, 0.0  &
   orientation = 275.7105931375d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_4.cm  &
   adams_id = 17  &
   location = 325.0, 50.0, 0.0  &
   orientation = 185.7105931375d, 90.0000000148d, 90.0000002166d
!
marker create  &
   marker_name = .Lab6.PART_4.MARKER_12  &
   adams_id = 12  &
   location = 300.0, 300.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Lab6.PART_4.MARKER_13  &
   adams_id = 13  &
   location = 350.0, -200.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Lab6.PART_4  &
   material_type = .Lab6.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Lab6.PART_4.LINK_7  &
   i_marker = .Lab6.PART_4.MARKER_5  &
   j_marker = .Lab6.PART_4.MARKER_6  &
   width = 40.0  &
   depth = 20.0
!
part attributes  &
   part_name = .Lab6.PART_4  &
   color = MAIZE  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .Lab6.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Lab6.PART_2.MARKER_7  &
   j_marker_name = .Lab6.ground.MARKER_8
!
constraint attributes  &
   constraint_name = .Lab6.JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Lab6.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Lab6.PART_2.MARKER_9  &
   j_marker_name = .Lab6.PART_3.MARKER_10
!
constraint attributes  &
   constraint_name = .Lab6.JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Lab6.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Lab6.PART_3.MARKER_11  &
   j_marker_name = .Lab6.PART_4.MARKER_12
!
constraint attributes  &
   constraint_name = .Lab6.JOINT_3  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Lab6.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Lab6.PART_4.MARKER_13  &
   j_marker_name = .Lab6.ground.MARKER_14
!
constraint attributes  &
   constraint_name = .Lab6.JOINT_4  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Lab6.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=1.0 number_of_steps=100 model_name=.Lab6"
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Lab6.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   joint_name = .Lab6.JOINT_1  &
   function = ""
!
constraint attributes  &
   constraint_name = .Lab6.MOTION_1  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Lab6.MOTION_1  &
   function = "360.0d * time"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Lab6.ground.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.A))
!
marker modify  &
   marker_name = .Lab6.ground.MARKER_14  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.D))
!
marker modify  &
   marker_name = .Lab6.PART_2.MARKER_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.A))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Lab6.ground.A, .Lab6.ground.B, "X"))  &
   relative_to = .Lab6.PART_2
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_2.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.B))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Lab6.ground.A, .Lab6.ground.B, "X"))  &
   relative_to = .Lab6.PART_2
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
geometry modify shape link  &
   link_name = .Lab6.PART_2.LINK_5  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
marker modify  &
   marker_name = .Lab6.PART_2.MARKER_7  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.A))  &
   relative_to = .Lab6.PART_2
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_2.MARKER_9  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.B))  &
   relative_to = .Lab6.PART_2
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_3.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.B))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Lab6.ground.B, .Lab6.ground.C, "X"))  &
   relative_to = .Lab6.PART_3
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_3.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.C))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Lab6.ground.B, .Lab6.ground.C, "X"))  &
   relative_to = .Lab6.PART_3
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
geometry modify shape link  &
   link_name = .Lab6.PART_3.LINK_6  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
marker modify  &
   marker_name = .Lab6.PART_3.MARKER_10  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.B))  &
   relative_to = .Lab6.PART_3
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_3.MARKER_11  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.C))  &
   relative_to = .Lab6.PART_3
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_4.MARKER_5  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.C))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Lab6.ground.C, .Lab6.ground.D, "X"))  &
   relative_to = .Lab6.PART_4
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_4.MARKER_6  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.D))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Lab6.ground.C, .Lab6.ground.D, "X"))  &
   relative_to = .Lab6.PART_4
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
geometry modify shape link  &
   link_name = .Lab6.PART_4.LINK_7  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
marker modify  &
   marker_name = .Lab6.PART_4.MARKER_12  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.C))  &
   relative_to = .Lab6.PART_4
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
marker modify  &
   marker_name = .Lab6.PART_4.MARKER_13  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Lab6.ground.D))  &
   relative_to = .Lab6.PART_4
!
defaults coordinate_system  &
   default_coordinate_system = .Lab6.ground
!
material modify  &
   material_name = .Lab6.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Lab6
