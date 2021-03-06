%Add necessary paths
buffer_bcidir=fileparts(fileparts(mfilename('fullpath'))); % parent directory
if ( exist(fullfile(buffer_bcidir,'dataAcq'),'dir') ) 
  addpath(fullfile(buffer_bcidir,'dataAcq')); 
  if ( exist(fullfile(buffer_bcidir,'dataAcq','buffer'),'dir') ) 
    addpath(fullfile(buffer_bcidir,'dataAcq','buffer')); 
  end
  if ( exist(fullfile(buffer_bcidir,'dataAcq','buffer','java'),'dir') ) % use java buffer if it's there
    bufferjavaclassdir=fullfile(buffer_bcidir,'dataAcq','buffer','java');
    addpath(bufferjavaclassdir); 
    bufferjar = fullfile(bufferjavaclassdir,'Buffer.jar');
    if ( exist(bufferjar,'file') ) 
      if ( ~any(strcmp(javaclasspath,bufferjar)) )
        warning('Modifying javaclass path -- this clears all variables!');
        javaaddpath(bufferjar); % N.B. this will clear all variables!
      end
    elseif ( ~any(strcmp(javaclasspath,bufferjavaclassdir)) )
      warning('Modifying javaclass path -- this clears all variables!');
      javaaddpath(bufferjavaclassdir); % N.B. this will clear all local variables!
    end
  end
end;
if ( exist(fullfile(buffer_bcidir,'bciLoop'),'dir') ) addpath(fullfile(buffer_bcidir,'bciLoop')); end;
if ( exist(fullfile(buffer_bcidir,'utilities'),'dir') ) addpath(fullfile(buffer_bcidir,'utilities')); end;
if ( exist(fullfile(buffer_bcidir,'stimulus'),'dir') ) addpath(fullfile(buffer_bcidir,'stimulus')); end;
if ( exist(fullfile(buffer_bcidir,'classifiers'),'dir') ) addpath(fullfile(buffer_bcidir,'classifiers')); end;
if ( exist(fullfile(buffer_bcidir,'plotting'),'dir') ) addpath(fullfile(buffer_bcidir,'plotting')); end;
if ( exist(fullfile(buffer_bcidir,'signalProc'),'dir') ) addpath(fullfile(buffer_bcidir,'signalProc')); end;


% general functions -- if needed, i.e. not already available in the above paths
bcicodeDirNames={'BCI_Code','BCI_code','Code',fullfile('source','mmmcode','BCI_code')};
if ( isempty(which('parseOpts')) )
  sdir=buffer_bcidir;
  while ( ~isempty(sdir) )
    for di=1:numel(bcicodeDirNames);
      bcicodedir=fullfile(sdir,bcicodeDirNames{di});
      if ( exist(bcicodedir,'dir') ) break; end;
    end
    if ( exist(bcicodedir,'dir') ) break; end;
    sdir=fileparts(sdir);
  end
  addpath(fullfile(bcicodedir,'toolboxes','utilities','general'));
  addpath(exGenPath(fullfile(bcicodedir,'toolboxes','classification')));
  addpath(exGenPath(fullfile(bcicodedir,'toolboxes','eeg_analysis')));
  addpath(exGenPath(fullfile(bcicodedir,'toolboxes','plotting')));
  addpath(exGenPath(fullfile(bcicodedir,'toolboxes','signal_processing')));
  addpath(exGenPath(fullfile(bcicodedir,'toolboxes','utilities')));
  addpath(exGenPath(fullfile(bcicodedir,'toolboxes','numerical_tools')));
end
