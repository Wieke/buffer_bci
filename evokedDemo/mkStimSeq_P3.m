function [stimSeq,stimTime,eventSeq,colors]=mkStimSeq_P3(h,duration,isi,tti)
if ( nargin<2 || isempty(duration) ) duration=3; end; % default to 3sec
if ( nargin<3 || isempty(isi) ) isi=6/60; end; % default to 5hz
if ( nargin<4 || isempty(tti) ) tti=isi*8; end; % default to ave target every 3rd event
% make a simple visual intermittent flash stimulus
colors=[1 1 1;...;  % color(1) = flash
        0 1 0]';    % color(2) = target
stimTime=0:isi:duration; % event every isi
stimSeq =-ones(numel(h),numel(stimTime)); % make stimSeq where everything is turned off
stimSeq(2:end-1,:)=0; % turn-on all symbols, to background color
eventSeq=cell(numel(stimTime),1);
% Pick who is going to be the target
tgt=randi(numel(h)-2);

% seq is random flash about 1/sec
for stimi=1:numel(h)-2;
  flashStim=-ones(numel(h),1); flashStim(2:end-1)=0; flashStim(1+stimi)=1; % flash only has symbol 1 set
  t=isi+fix(rand(1)*10)/10;
  while (t<max(stimTime)) % loop to find a flash time not at the same time as another symbol
    [ans,si]=min(abs(stimTime-t)); % find nearest stim time    
    si=2*fix(si/2);
    if ( all(stimSeq(2:end-1,si)<=0) || rand(1)>.5 ) % only insert if nothing else happening
      stimSeq(:,si)=flashStim;
    end; 
    t=stimTime(si);
    dt=(.5+rand(1)/2)*tti;
    t=t+dt;
  end
end
% make the event seq from the stimSeq
for si=1:size(stimSeq,2);
  if ( stimSeq(tgt+1,si)>0 )
    eventSeq{si}={'stimulus','P3 Tgt'}; % this is a target event
  else
    eventSeq{si}={'stimulus','P3 Non-Tgt'}; % this is a target event
  end
end

% add the target display
stimTime=[0 stimTime+1];
flashStim=-ones(numel(h),1); flashStim(2:end-1)=0; flashStim(1+tgt)=2; % tgt has 2 set
stimSeq=cat(2,flashStim,stimSeq);
eventSeq=cat(1,{{'stimulus.target',tgt}},eventSeq);

return;
