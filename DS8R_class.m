% 1.Initialization  
%    obj = DS8R_class;     
%    after initialization, you can see the object on the Workspace.
%
% 2. Parameter setting
%    set_DS8R(obj, Parameter, Value)
%         setting the Parameter value of obj as Value.
%         this function doesn't change the DS8R's parameter.
%         DS8R's parameter will be changed when you use function exe_DS8R(obj)
%
%     <Parameters / Values>
%        Demand / 150(default) range is 10 to 5000
%        Enabled / 1(default) values are 0(Disabled), 1(Enabled)
%        PulseWidth / 1000(default) range is 100 to 2000
%        Dwell / 10(default) range is 1 to 990
%        Mode / 1(default) values are 1(Mono-Phasic), 2(Bi-Phasic)
%        Polarity / 1(default) values are 1(Positive), 2(Negative), 3(Alternating)
%        Source / 1(default) values are 1(internal), 2(External)
%        Recovery / 10(default) range is 10 to 100
%
% 3. Apply parameter changes to DS8R and trigger
%    exe_DS8R(obj)
%      activating DS8R with obj's parameters
classdef DS8R_class < handle
    
    %Defualt parameter setting
    properties    
        Demand = 150  % 10 to 5000
        Enabled =1 % 0 Disabled, 1 Enabled
        PulseWidth = 1000 % 100 to 2000
        Dwell = 10 % 1 to 990
        Mode = 1 % 1 Mono-Phasic, 2 Bi-Phasic
        Polarity = 1   % 1 Positive, 2 Negative, 3 Alternating
        Source = 1  % 1 internal, 2 External
        Recovery =10  % 10 to 100
    end
    
    %%
    methods
        
        %%The function to Set the parameters on Matlab not in DS8R
        function set_DS8R(obj, varargin)
            for n = 1:2:nargin-1
                if (~isnumeric(varargin{n+1}))
                    error("Please input integer for Parameter value")
                end
                switch varargin{n}
                    case 'Demand'
                        if varargin{n+1}>9 & varargin{n+1}<5001
                            obj.Demand = varargin{n+1};
                        else
                            error("For Demand, correct input arrange is 10 to 5000")
                        end
                    case 'Enabled'
                        if varargin{n+1} == 0 | varargin{n+1} == 1
                            obj.Enabled = varargin{n+1};
                        else
                            error("For Enabled, 0 = Disabled, 1 = Enabled, Others are wrong")
                        end
                    case 'PulseWidth'
                        if varargin{n+1}>99 & varargin{n+1}<2001
                            obj.PulseWidth = varargin{n+1};
                        else
                            error("For PulseWidth, correct input arrange is 100 to 2000")
                        end
                    case 'Dwell'
                        if varargin{n+1}>0 & varargin{n+1}<991
                            obj.Dwell = varargin{n+1};
                        else
                            error("For Dwell, correct input arrange is 1 to 990")
                        end
                    case 'Mode'
                        if varargin{n+1}==1 | varargin{n+1}==2
                            obj.Mode = varargin{n+1};
                        else
                            error("For Mode, 1 = Monophasic, 2 = Biphasic, Others are wrong")
                        end
                    case 'Polarity'
                        if varargin{n+1}==1 | varargin{n+1}==2 | varargin{n+1}==3
                            obj.Polarity = varargin{n+1};
                        else
                            error("For Polarity,  1 = Positive, 2 = Negative, 3 = Alternating, Others are wrong")
                        end
                    case 'Source'
                        if varargin{n+1}==1 | varargin{n+1}==2
                            obj.Source = varargin{n+1};
                        else
                            error("For source, 1 = internal, 2 = External, Others are wrong")
                        end
                    case 'Recovery'
                        if varargin{n+1}>9 & varargin{n+1}<101
                            obj.Recovery = varargin{n+1};
                        else
                            error("For Recovery, orrect input arrange is 10 to 100")
                        end
                    otherwise
                        error("Wrong Parameter name! Correct Parameters are : 'Mode', 'Polarity', 'Source', 'Demand', 'PulseWidth', 'Dwell', 'Recovery', 'Enabled' ")
                end
            end
        end
            
        %% The function to change parameter on DS8R and trigger
        function exe_DS8R(obj)
                
                filename = 'DS8R_API';
                c_Mode = num2str(obj.Mode);
                c_Polarity = num2str(obj.Polarity);
                c_Source = num2str(obj.Source);
                c_Demand = num2str(obj.Demand);
                c_PulseWidth =  num2str(obj.PulseWidth);
                c_Dwell = num2str(obj.Dwell);
                c_Recovery = num2str(obj.Recovery);
                c_Enabled =  num2str(obj.Enabled);
                
                str = {filename, c_Mode, c_Polarity, c_Source, c_Demand, c_PulseWidth, c_Dwell, c_Recovery, c_Enabled};

                code = strjoin(str,' ');
                unix(code)
                
        end
    end
end
