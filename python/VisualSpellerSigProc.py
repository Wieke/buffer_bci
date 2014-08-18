import bufferbci.preproc as preproc
import bufferbci.fieldtrip.bufhelp as bufhelp
import pickle

bufhelp.connect()

trlen_ms = 600

run = True
print "Waiting for startPhase.cmd event."
while run:
    e = bufhelp.waitforevent("startPhase.cmd",1000, False)
    if e is not None:
        if e.value == "calibration":
            events, data = bufhelp.gatherdata("stimulus.tgtFlash",trlen_ms,("stimulus.training","end"), milliseconds=True)
            pickle.dump({"events":events,"data":data}, open("subject_data", "w"))
        elif e.value == "train":
            data = preproc.detrend(data)
            data, badch = preproc.badchannelremoval(data)
            data = preproc.spatialfilter(data)
            data = preproc.spectralfilter(data, 0.3, 8.0, bufhelp.fSample)
            data, events, badtrials = preproc.badtrailremoval(data, events)
        elif e.value =="feedback":
            pass
        elif e.value =="exit":
            run = False
        print "Waiting for startPhase.cmd event."
    