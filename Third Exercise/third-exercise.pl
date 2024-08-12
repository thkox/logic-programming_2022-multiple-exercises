% facts stating the parts of the pc
component(computer, motherboard).
component(computer, cpu).
component(computer, ram).
component(computer, psu).
component(computer, gpu).
component(computer, hard_drive).

% ---------------------------------------------------------------------

% facts stating the components of the motherboard
component(motherboard, chip).
component(motherboard, capacitors).
component(motherboard, transistors).
% facts stating the components of the cpu
component(cpu, registers).
component(cpu, cache).
component(cpu, heatsink).
% facts stating the components of the ram
component(ram, cas).
component(ram, controller).
component(ram, chip).
% facts stating the components of the psu
component(psu, transformer).
component(psu, fan).
component(psu, cable).
% facts stating the componets of the gpu
component(gpu, power_connectors).
component(gpu, ram).
component(gpu, pcie).
% facts stating the componets of the hard_drive
component(hard_drive, platters).
component(hard_drive, spindle).

% -------------------------facts stating all the sub-components of the main components----------------
% facts stating the sub-components of the chip
component(chip, integrated_circuit).
component(chip, capacitors).
component(chip, transistors).
% facts stating the sub-components of the capacitors
component(capacitors, dielectric_layer).
component(capacitors, metal_electrodes).
component(capacitors, metal_leads).
% facts stating the sub-components of the transistors
component(transistors, base).
component(transistors, collector).
component(transistors, emitter).
% facts stating the sub-components of the registers
component(registers, control_unit).
component(registers, program_counter).
component(registers, stack_pointer).
% facts stating the sub-components of the cpu cache
component(cache, l1_cache).
component(cache, l2_cache).
component(cache, l3_cache).
% facts stating the sub-components of the heatsink
component(heatsink, baseplate).
component(heatsink, heatpipes).
component(heatsink, fan).
% facts stating the sub-components of the cas
component(cas, module_board).
component(cas, memory_chips).
component(cas, connectors).
% facts stating the sub-componets of the controller
component(controller, sense_amplifiers).
component(controller, data_register).
component(controller, command_register).
% facts stating the sub-componets of the transformer
component(transformer, primary_windings).
component(transformer, core).
component(transformer, insulation).
component(transformer, lead_wires).
% facts stating the sub-componets of the fan
component(fan, fan_motor).
component(fan, fan_blade).
component(fan, fan_controller).
% facts stating the sub-componets of the cable
component(cable, wires).
component(cable, connector).
component(cable, insulation).
% facts stating the sub-componets of the power_connectors
component(power_connectors, connector_pins).
component(power_connectors, connector_socket).
component(power_connectors, locking_mechanism).
% facts stating the sub-componets of the  pcie
component(pcie, connector_pins).
component(pcie, connector_socket).
% facts stating the sub-components of the platters
component(platters, disk_surface).
component(platters, spindle_motor).
component(platters, read_write_head).
% facts stating the sub-components of the spindle
component(spindle, stator).
component(spindle, bearings).
component(spindle, shaft).

% ---------------------------------------------------------------------

% facts stating whether the components are made of metal or plastic
material(motherboard, plastic).
material(heatsink, metal).
material(ram, plastic).
material(psu, metal).
material(cable, metal).
material(fan, plastic).
material(transformer, metal).
material(gpu, plastic).
material(hard_drive, metal).
material(platters, metal).
material(connectors, metal).
material(fan_controller, plastic).
material(wires, metal).
material(connector, metal).
material(insulation, plastic).
material(connector_pins, metal).
material(connector_socket, metal).
material(locking_mechanism, metal).
material(disk_surface, metal).
material(spindle_motor, metal).
material(read_write_head, metal).
material(stator, metal).
material(bearings, metal).
material(shaft, metal).

% ------------------rules necessery for the program -----------------------------

% rule for finding the parts of the computer
find_computer_parts(List) :- findall(Y, component(computer,Y), List).

% rule for finding the first layer of sub_components of the component X
find_sub_components(Component, List) :- findall(Y, component(Component,Y), List).

% rule for finding all the components that has plastic or metal in them
is_made_of_plastic(Component) :- material(Component, plastic).
is_made_of_metal(Component) :- material(Component, metal).

% rule for finding components that has plastic or metal
is_made_of(Component, Material) :- material(Component, Material).

% rule for finding all the sub-components
all_sub_components(Component, Y) :- component(Component, Y).
all_sub_components(Component, Y) :- component(Component, Z), all_sub_components(Z, Y).