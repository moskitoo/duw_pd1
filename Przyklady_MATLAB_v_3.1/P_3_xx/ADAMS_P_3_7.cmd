!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
   angle = rad  &
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
   size_of_icons = 0.5  &
   spacing_for_grid = 1.0
!
!------------------------------ Adams/View Model ------------------------------!
!
!
model create  &
   model_name = DUW
!
model attributes  &
   model_name = DUW  &
   size_of_icons = 0.5
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .DUW.steel  &
   adams_id = 1  &
   youngs_modulus = 2.07E+011  &
   poissons_ratio = 0.29  &
   density = 7801.0
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
   default_coordinate_system = .DUW.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .DUW.ground.MARKER_7  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 4.7123889804, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = MARKER_7  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.ground.MARKER_15  &
   adams_id = 15  &
   location = 4.0, -1.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .DUW.ground  &
   material_type = .DUW.steel
!
part attributes  &
   part_name = .DUW.ground  &
   name_visibility = off  &
   size_of_icons = 0.5
!
!----------------------------------- suwak ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .DUW.ground
!
part create rigid_body name_and_position  &
   part_name = .DUW.suwak  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .DUW.suwak
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .DUW.suwak.MARKER_1  &
   adams_id = 1  &
   location = -1.0, 1.0, -0.5  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = MARKER_1  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.suwak.cm  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = cm  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.suwak.MARKER_12  &
   adams_id = 12  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = MARKER_12  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.suwak.MARKER_6  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 4.7123889804, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = MARKER_6  &
   size_of_icons = 0.5
!
part create rigid_body mass_properties  &
   part_name = .DUW.suwak  &
   mass = 5.0  &
   center_of_mass_marker = .DUW.suwak.cm  &
   ixx = 2.0  &
   iyy = 2.0  &
   izz = 2.0  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .DUW.suwak.BOX_1  &
   adams_id = 1  &
   corner_marker = .DUW.suwak.MARKER_1  &
   diag_corner_coords = 2.0, -2.0, 1.0
!
part attributes  &
   part_name = .DUW.suwak  &
   color = GREEN  &
   name_visibility = off  &
   size_of_icons = 0.5
!
!---------------------------------- wahadlo -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .DUW.ground
!
part create rigid_body name_and_position  &
   part_name = .DUW.wahadlo  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.7853981634, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .DUW.wahadlo
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .DUW.wahadlo.MARKER_9  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker attributes  &
   marker_name = MARKER_9  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.wahadlo.MARKER_10  &
   adams_id = 10  &
   location = 0.0, -2.0, 0.0  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker attributes  &
   marker_name = MARKER_10  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.wahadlo.cm  &
   adams_id = 13  &
   location = 0.0, -1.0, 0.0  &
   orientation = 3.1415926536, 1.5707963268, 1.5707963268
!
marker attributes  &
   marker_name = cm  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.wahadlo.MARKER_11  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 5.4977871438, 0.0, 0.0
!
marker attributes  &
   marker_name = MARKER_11  &
   size_of_icons = 0.5
!
marker create  &
   marker_name = .DUW.wahadlo.MARKER_14  &
   adams_id = 14  &
   location = 0.0, -2.0, 0.0  &
   orientation = 5.4977871438, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .DUW.wahadlo  &
   mass = 3.0  &
   center_of_mass_marker = .DUW.wahadlo.cm  &
   ixx = 1.0  &
   iyy = 1.0  &
   izz = 1.0  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .DUW.wahadlo.LINK_2  &
   i_marker = .DUW.wahadlo.MARKER_9  &
   j_marker = .DUW.wahadlo.MARKER_10  &
   width = 0.2  &
   depth = 0.1
!
part attributes  &
   part_name = .DUW.wahadlo  &
   color = MAGENTA  &
   name_visibility = off  &
   size_of_icons = 0.5
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .DUW.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .DUW.wahadlo.MARKER_11  &
   j_marker_name = .DUW.suwak.MARKER_12
!
constraint attributes  &
   constraint_name = .DUW.JOINT_3  &
   name_visibility = off  &
   size_of_icons = 0.5
!
constraint create joint translational  &
   joint_name = .DUW.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .DUW.suwak.MARKER_6  &
   j_marker_name = .DUW.ground.MARKER_7
!
constraint attributes  &
   constraint_name = .DUW.JOINT_2  &
   name_visibility = off  &
   size_of_icons = 0.5
!
!----------------------------------- Forces -----------------------------------!
!
!
!-------------------------- Adams/View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .DUW.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .DUW.Tlumik  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .DUW.Tlumik  &
   color = RED
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .DUW.Tlumik.i_marker  &
   object_value = (.DUW.wahadlo.MARKER_14)
!
variable modify  &
   variable_name = .DUW.Tlumik.j_marker  &
   object_value = (.DUW.ground.MARKER_15)
!
variable modify  &
   variable_name = .DUW.Tlumik.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .DUW.Tlumik.stiffness_coefficient  &
   real_value = 0.0
!
variable modify  &
   variable_name = .DUW.Tlumik.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .DUW.Tlumik.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .DUW.Tlumik.damping_coefficient  &
   real_value = 10.0
!
variable modify  &
   variable_name = .DUW.Tlumik.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .DUW.Tlumik.free_length_mode  &
   string_value = "Design_Length"
!
variable modify  &
   variable_name = .DUW.Tlumik.free_length  &
   real_value = 1.0
!
variable modify  &
   variable_name = .DUW.Tlumik.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .DUW.Tlumik.i_dynamic_visibility  &
   string_value = "On"
!
variable modify  &
   variable_name = .DUW.Tlumik.j_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .DUW.Tlumik.spring_visibility  &
   string_value = "never"
!
variable modify  &
   variable_name = .DUW.Tlumik.damper_visibility  &
   string_value = "depends"
!
ude modify instance  &
   instance_name = .DUW.Tlumik
!
undo end_block
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -10.0  &
   z_component_gravity = 0.0
!
force attributes  &
   force_name = gravity  &
   size_of_icons = 0.5
!
!----------------------------- Analysis settings ------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .DUW.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select end_time=1.0 number_of_steps=100 model_name=.DUW initial_static=no"
!
!---------------------------- Function definitions ----------------------------!
!
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .DUW.Tlumik
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
geometry modify shape link  &
   link_name = .DUW.wahadlo.LINK_2  &
   width = (0.2meter)  &
   depth = (0.1meter)
!
material modify  &
   material_name = .DUW.steel  &
   youngs_modulus = (2.07E+011(Newton/meter**2))  &
   density = (7801.0(kg/meter**3))
!
model display  &
   model_name = DUW
