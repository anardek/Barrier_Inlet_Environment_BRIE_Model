%WaveTideRun3: 
%a0=0:0.1:1, hs = 0.5:0.1:1.5, Qow_max=50, Jmin=20km,grain_size=3e-4, marsh_cover=0.9, slr=2e-3, wave_period=7s w_b_crit=300m

%WaveTideRun4:
%a0=0:0.1:1, hs = 0.5:0.1:1.5, Qow_max=30, Jmin=20km,grain_size=3e-4, marsh_cover=0.8, slr=1e-3, wave_period=7s w_b_crit=200m

%WaveTideRun5:
%a0=0.5, hs = 0.5:0.2:1.5, Qow_max=30, Jmin=20km,grain_size=3e-4, marsh_cover=0.8, slr=0:5e-4:5e-3, wave_period=7s w_b_crit=200m

%WaveTideRun6:
%a0=0:0.1:1, hs = 0.5:0.1:1.5, Qow_max=25, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=2e-3, wave_period=10s w_b_crit=200m, (depth = 3?)

%WaveTideRun7: (drowning w inlet)
%a0=0.5, hs = 0.5:0.1:1.5, Qow_max=5, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=0:1e-3:1e-2, wave_period=10s w_b_crit=200m, (depth = 5?)

%WaveTideRun8:
%a0=0.5, hs = 1, Qow_max=5:5:50, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=2e-3, wave_period=10s w_b_crit=200m, (depth = 5)

%AsymHsRun
%a0=0.5, hs = 1, Qow_max=25, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=2e-3, wave_period=10s w_b_crit=200m, depth = 3m

%WaveTideRun9: (drowning wh inlet, 1d)
%a0=0.5, hs = 0.5:0.1:1.5, Qow_max=5, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=0:1e-3:1e-2, wave_period=10s w_b_crit=200m, (depth = 5?)

%WaveTideRun10: (drowning wh inlet)
%a0=0.5, hs = 0.5:0.1:1.5, Qow_max=5, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=0:1e-3:1e-2, wave_period=10s w_b_crit=200m, (depth = 5?)

%check mass balance:
%Vbarrier = b_struct.dy.*(sum(out.d_sf.*out.d_sf./out.s_sf_save./2.*(1-(b_struct.s_background./out.s_sf_save)),1)+sum(out.h_b_save.*double(out.x_b_save-out.x_s_save),1));

%drowning run no inlet
%a0=0.5, hs = 0.5:0.25:2, Qow_max=5, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=0:1e-3:1e-2, wave_period=10s w_b_crit=200m, (depth = 5?)

%drowning run inlet
%a0=0.5, hs = 0.5:0.1:1.5, Qow_max=5, Jmin=20km,grain_size=2e-4, %marsh_cover=0.5, slr=0:1e-3:1e-2, wave_period=10s w_b_crit=200m, (depth = 5?)

%grid test run and timestep run name = 'mass_balance_inlet2';
%param = {'dt','dy'}; param1 = [0.01 0.02 0.025 0.05 0.08 0.1 0.2 0.25]; param2 = [1000 800 500 400 250 100 80 50];

%% KA RUNS

% name = 'matlab_grid_testing_inlets_on_V7pt1_v4_full'; default parameters
% with param = {'dt','dy'}; param1 = [0.01 0.02 0.025 0.05 0.08 0.1 0.2 0.25];
% param2 = [1000 800 500 400 250 100 80 50];

% name = 'matlab_grid_testing_inlets_on_V7pt1_v5_full'; default parameters
% with param = {'dt','dy'}; param1 = [0.01 0.02 0.025 0.05 0.08 0.1 0.2 0.25];
% param2 = [1000 800 500 400 250 100 80 50]; AND       
% b_struct.a0  = 1.5;    % higher tidal amplitude (0.5 m)
% b_struct.slr = 3e-3;   % higher slr (2e-3 m/yr)
% b_struct.wave_height = 1.5; % higher wave height (1 m)
% b_struct.wave_period = 8;   % lower wave period (10 s)
% (test against Jaap's paper Figure 9 initial parameters from
% 'massbalanceinlet'

% name = 'matlab_grid_testing_inlets_on_V7pt1_v6_full'; 
% with param = {'dt','dy'}      
% b_struct.wave_height = 1.5;  % higher wave height (1 m)
% b_struct.bb_depth = 5;       % deeper back-barrier (3 m)
% b_struct.Qow_max = 5;        % lower maximum overwash
% b_struct.w_b_crit = 250; %critical barrier width m
% (test - can I achieve a higher tidal transgressive flux? - not by much, 
% also barrier drowning) 

% name = 'matlab_grid_testing_inlets_on_V7pt1_v7_sub'; 
% with param = {'dt','dy'}; param1 = [1];
% param2 = [1000 800 500 400 250 100 80 50]; AND all default params      
% (test - what grid size is optimal for a 1 year time step?)

% name = 'matlab_NLT19_fig6_test'; 
% all default parameters except for a0 = 1 (Figure 6) 
% (can I recreate Figure 6)

%% run_barrier_model
%name = 'matlab_NLT19_fig6_test';
name = 'test_brie_matlab_seed';
param = {'dt','dy'}; 
%param1 = [0.05];
%param2 = [100];
%param1 = [0.01 0.02 0.025 0.05 0.08 0.1 0.2 0.25];  % original
%param2 = [1000 800 500 400 250 100 80 50];
param1 = [0.05 0.1 0.25 0.50 1];  % yr
param2 = [1000 500 250 100 50];   % m
output = cell(length(param1),length(param2));

%% KA: modified for seeding and grid discretization testing

%parfor ii=1:length(param1)
for ii=1:length(param1)
    
    % tracking
    disp(param1(ii))
    
    % temp output for parfor
    tmp_output = cell(1,length(param2));
    
    for jj=1:length(param2)
        
        % tracking
        disp(param2(jj))
        
        % get standard initialization parameters
        b_struct = initialize_barrier_model;
        
        % update for our grid discretization testing
        b_struct.name = name;
        b_struct.make_gif = false;
        b_struct.plot_on = false;
        b_struct.inlet_model_on = true;
        b_struct.barrier_model_on = true;
        b_struct.bseed = true;
        b_struct.nt = 1e3./param1(ii);  % only run for 1000 morph yrs
        b_struct.(param{1}) = param1(ii);
        b_struct.(param{2}) = param2(jj);
        
        % individual run modifications go here
        %b_struct.a0 = 1;
        b_struct.h_b_crit = 1.9;
        b_struct.w_b_crit = 450;
        b_struct.wave_height = 1;
        b_struct.wave_period = 7;
        
        % run model and save to temporary variable
        tmp_output(jj) = {barrier_model(b_struct)};
    
    end
    
    % save to final output variable
    output(ii,:) = tmp_output;
    
end

% with this parfor method I lose the bstruct
%save(name,'output','param','param1','param2')
save(name,'b_struct','output','param','param1','param2')

% %% individual CASCADE comparison runs
% name = 'CASCADE_comparison_inlets_off';
% b_struct = initialize_barrier_model;
% b_struct.name = name;
% %b_struct.dtsave = 20;  # just compare for a larger domain
% b_struct.h_b_crit = 1.9;
% b_struct.inlet_max = 100;
% b_struct.inlet_model_on = false;
% %b_struct.nt = 60000;  # just compare for a larger domain
% %b_struct.ny = 60;
% b_struct.plot_on = false;
% b_struct.make_gif = false;
% b_struct.w_b_crit = 450;
% b_struct.wave_height = 1;
% b_struct.wave_period = 7;
% output1 = barrier_model(b_struct);
% 
% name = 'CASCADE_comparison_inlets_off';
% b_struct = initialize_barrier_model;
% b_struct.name = name;
% b_struct.dtsave = 20;  % just compare for a larger domain
% b_struct.h_b_crit = 1.9;
% b_struct.inlet_max = 100;
% b_struct.inlet_model_on = false;
% b_struct.nt = 60000;  % just compare for a larger domain
% b_struct.ny = 60;
% b_struct.plot_on = false;
% b_struct.make_gif = false;
% b_struct.w_b_crit = 450;
% b_struct.wave_height = 1;
% b_struct.wave_period = 7;
% output2 = barrier_model(b_struct);
% 
% name = 'CASCADE_comparison_inlets_on';
% b_struct = initialize_barrier_model;
% b_struct.bseed = true;
% b_struct.name = name;
% %b_struct.dtsave = 20;  # just compare for a larger domain
% b_struct.h_b_crit = 1.9;
% b_struct.inlet_model_on = true;
% %b_struct.nt = 60000;  % just compare for a larger domain
% %b_struct.ny = 60;
% b_struct.plot_on = false;
% b_struct.make_gif = false;
% b_struct.w_b_crit = 450;
% b_struct.wave_height = 1;
% b_struct.wave_period = 7;
% output3 = barrier_model(b_struct);
% 
% save(name,'b_struct','output','param','param1','param2','-v7.3')
% 
% %% test old versus new matlab version
% 
% name = 'test_m_v1';
% b_struct = initialize_barrier_model_KA;
% b_struct.name = name;
% b_struct.dtsave = 20;  % just compare for a larger domain
% b_struct.h_b_crit = 1.9;
% b_struct.inlet_model_on = true;
% b_struct.nt = 60000;  % just compare for a larger domain
% %b_struct.ny = 60;
% b_struct.plot_on = false;
% b_struct.make_gif = false;
% b_struct.w_b_crit = 450;
% b_struct.wave_height = 1;
% b_struct.wave_period = 7;
% output4 = barrier_model_KA(b_struct);
% 
% name = 'test_m_v2';
% b_struct = initialize_barrier_model;
% b_struct.name = name;
% b_struct.dtsave = 20;  % just compare for a larger domain
% b_struct.h_b_crit = 1.9;
% b_struct.inlet_model_on = true;
% b_struct.nt = 60000;  % just compare for a larger domain
% %b_struct.ny = 60;
% b_struct.plot_on = false;
% b_struct.make_gif = false;
% b_struct.w_b_crit = 450;
% b_struct.wave_height = 1;
% b_struct.wave_period = 7;
% output5 = barrier_model(b_struct);
% 
% figure;   % I don't think dt should be here
% plot(output4.Qinlet.*b_struct.dt./b_struct.dy), hold on
% plot(output5.Qinlet.*b_struct.dt./b_struct.dy), hold on
% plot(output4.Qoverwash./b_struct.dy), hold on
% plot(output5.Qoverwash./b_struct.dy)
% %legend('inlets on - Qinlet', 'inlets on - Qoverwash', 'inlets off - Qoverwash')
% plotFancyAxis
% title('Transgressive Fluxes')
% xlabel('Time (ka)')
% ylabel('Transgressive flux (m^3/yr)')
% 
% figure;   % I don't think dt should be here
% plot(output3.Qinlet.*b_struct.dt./b_struct.dy), hold on
% plot(output3.Qoverwash./b_struct.dy)








