function [OUT,gbest,gbestval]=IWO(Functname,DataDim,PosRange,IterNo,Smax,Smin,pop_max)
% 函数功能：解空间维数DataDim为IWO算法，优化目标为最小化适应度函数
% 输入参数:
%     Functname -- 待优化函数（适应度函数）
%     DistName  -- 距离函数
%     DataDim   -- 数据空间维数
%     PosRange  -- 粒子的位置范围，（2*DataDim）
%     IterNo    -- 最大迭代次数
% 输出参数：
%     OUT       -- 第i次PSO迭代的群体最优解OUT(i,1:DataDim)及最优适应度函数值OUT(i,1+DataDim)
%     gbest     -- 群体最优解
%     gbestval  -- 最优适应度函数值
% Ref: "A novel numerical optimization algorithm inspired from weed colonization"
% "Artificial Foraging Weeds for Global Numerical Optimization over Continuous Spaces"

%%%%%%%%%%%%%%%%%%%%%%%%%%
% IWO参数
PosMin=PosRange(1,:); % 粒子位置下限 1*DataDim
PosMax=PosRange(2,:); % 粒子位置上限 1*DataDim
%Vmax=(PosMax-PosMin)/2;       % 粒子速度上限 1*DataDim
epsC   = 1e-25;   % minimum global error gradient (ergrd)
%                   % if abs(Gbest(i+1)-Gbest(i)) < gradient over 
%                   % certain length of epochs, terminate run, default = 1e-25
epsCNo = 250;  % epochs before error gradient criterion terminates run,  (ergrdep)
%                   % default = 150, if the SSE(d^2) does not change over 250 epochs
%                   % then exit                    

% take care of setting max velocity and position params here
% posmaskmin  = repmat(PosMin,S,1);  % min pos, S*DataDim matrix
% posmaskmax  = repmat(PosMax,S,1);  % max pos

%---------------------------
%          初始化 
%---------------------------
% 3.1. Initialize a population: pbest
pop_size=20;  % 初始种群数
%pop_max=40;
for i=1:pop_size
    
    pbest(i,:)=unifrnd(forcerow(PosMin),forcerow(PosMax)); %#ok<AGROW>
end
pbestval = feval(Functname,pbest);

tr=Inf(1,IterNo+1);
tr(1)=min(pbestval);

% start IWO iterative procedures
cnt   = 0; % counter used for the stopping subroutine based on error convergence
h = waitbar(0,'IWO iterations...');
%Smax=3;
%Smin=1;
Sigma_Init=sqrt((abs(PosMax)+abs(PosMin))/2);  %
Sigma_Final=ones(1,DataDim)*0.00001;
% Those members ranked worse than pop_max are given a chance to enter the
% new population with a probability P000 =0.05.
P000=0.05;
worse_pop_size=ceil(pop_max*P000);
for iter=1:IterNo  % start epoch loop (iterations)
    waitbar(iter/IterNo,h);
    % 3.2. Reproduction
    % Seed production procedure in a colony of weeds.    
    val_min=min(pbestval);
    val_max=max(pbestval);
    %SeedNum=zeros(pop_size,1);
    if val_min==val_max
        SeedNum=ones(pop_size,1)*Smax;
    else
        SeedNum=floor((pbestval-val_max)./(val_min-val_max)*(Smax-Smin)+Smin);
        SeedNum=max(SeedNum,Smin);
%         SeedNum=floor((pbestval-val_min)./(val_max-val_min)*(Smax-Smin)+Smin);
%         SeedNum=max(SeedNum,Smin);
        % Thus, the above reproduction technique is proposed to give a 
        % chance to infeasible individuals to survive and reproduce 
        % similar to the mechanism happens in the nature.
    end
    
    % 3.3. Spatial dispersal    
    pow=2;
    Sigma_iter=(1-iter/IterNo)^pow*abs(cos(iter))*(Sigma_Init-Sigma_Final)+Sigma_Final;   
    DELTAPOS=randn(sum(SeedNum),DataDim).*repmat(Sigma_iter,sum(SeedNum),1);
    pos=zeros(sum(SeedNum),DataDim);
    cnt00=0;
    for w=1:pop_size
        pbest_w=pbest(w,:);
        for j=1:SeedNum(w)
            cnt00=cnt00+1;
            pos(cnt00,:)=DELTAPOS(cnt00,:)+pbest_w;
        end
    end
    for i=1:DataDim
        pos(:,i)=min(pos(:,i),PosMax(i));
        pos(:,i)=max(pos(:,i),PosMin(i));
    end
    
    % 3.4. Competitive exclusion
    out=feval(Functname,pos);
    pos(sum(SeedNum)+1:sum(SeedNum)+pop_size,:)=pbest;
    out(sum(SeedNum)+1:sum(SeedNum)+pop_size,:)=pbestval;
    
    pop_size=size(pos,1);
    if pop_size<=pop_max
        pbest=pos;
        pbestval=out;
    else
        % Those members ranked worse than pop_max are given a chance to enter the
        % new population with a probability P000 =0.05.
        [outi,idx]=sort(out);
        worse_size=pop_size-pop_max;
        if worse_size<=worse_pop_size
            ind=[1:(pop_max-worse_size) (pop_max+1):pop_size];             
        else
            ind=[1:(pop_max-worse_pop_size) randsample(worse_size,worse_pop_size)'+pop_max];
        end
        pbest=pos(idx(ind),:);
        pbestval=out(idx(ind),:);
        pop_size=pop_max;         
%         pbest=pos(idx(1:pop_size),:);
%         pbestval=out(idx(1:pop_size),:);
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    gbestval=pbestval(1);
    gbest=pbest(1,:);
    
    % keep track of global best val
    tr(iter+1)          = gbestval;
    %PSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSOPSO
    %------------------------------------------------------------------------ 
    
    %第三步：迭代终止判断
    % check for stopping criterion based on speed of convergence to desired
%     tmp1 = abs(tr(iter) - gbestval);
%     if tmp1 > epsC
%         cnt = 0;
%     elseif tmp1 <= epsC
%         cnt = cnt+1;
%         if cnt >= epsCNo
%             disp(['--> Solution likely, GBest hasn''t changed by at least ',...
%                 num2str(epsC),' for ',...
%                 num2str(cnt),' epochs.']);
%             break
%         end
%     end

end  % end epoch loop
close(h);

% 优化过程中群体最优适应度函数值的变化曲线
OUT=tr;
%plot([0:length(OUT)-1],OUT);
end


 