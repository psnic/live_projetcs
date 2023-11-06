/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$('#recordingIconContainer').addClass("d-none");
//$('#terminateCallBtn').hide();


var ishold = false;
var usercode = $("#usercode").val();
function toggleTerminate(kind) {
    if (kind === 'e') {
        $("#terminateCall").removeAttr("disabled");
    } else if (kind === 'd') {
        $("#terminateCall").attr("disabled", "disabled");
    }
    return;
}
toggleTerminate('d');
var ipaddr = "10.179.2.75";
var ipprt = "8088";
var user = $("#usercode").val();

var socket = new JsSIP.WebSocketInterface('ws://' + ipaddr + ':' + ipprt + '/ws');
var configuration = {
    sockets: [socket],
    uri: 'sip:' + user + '@' + ipaddr,
    password: '123',
    authorization_user: user,
    display_name: user,
    register: true,
    session_timers: false,
    trace_sip: true
};
var ua = new JsSIP.UA(configuration);
ua.start();
ua.on('connected', function (e) {
    console.log("Connected");
    globalSession = e.session;
});
ua.on('disconnected', function (e) {
    console.log("Disconnected");
    globalSession = null;
});
ua.on('ended', function (e) {
    console.log("Call Ended");
    globalSession = null;
});
ua.on('peerconnection', function (e) {
    console.log("Peer Connection");
});

ua.on('invite', function (session) {
    // Register event handlers for call ending and failure
    session.on('ended', function () {
        console.log('Call ended');
    });

    session.on('failed', function (e) {
        if (e.status_code === 487) {
            console.log('Missed call');
        } else {
            console.log('Call failed');
        }
    });

    // Answer the call
    session.answer({
        mediaConstraints: {audio: true, video: false}
    });
});


var callOptions = {
    'mediaConstraints': {
        'audio': true,
        'video': false
    }
};

ua.on('newRTCSession', function (e) {
    var rtad = document.createElement('audio');
    var phoneno;
    var calldailog;
    var session = e.session;
    globalSession = session;
    toggleTerminate('e');
    if (session.direction === "incoming") {
        toggleTerminate('e');
        var tobj = e.request.headers["Remote-Party-Id"][0].raw;
        phoneno = tobj.substring(
                tobj.indexOf('"') + 1,
                tobj.lastIndexOf('"')
                );
//        checkIfOldCase(phoneno);
        rtad.src = 'js/assets/ringtone.wav';
        rtad.loop = true;
        rtad.play();
        calldailog = $.confirm({
            title: 'Incoming Call!',
            content: 'Call From ' + phoneno,
            type: 'red',
            typeAnimated: true,
            buttons: {
                acceptCall: {
                    text: 'Answer',
                    btnClass: 'btn-green',
                    keys: ['enter'],
                    action: function () {
                        rtad.pause();
                        $('#recordingIconContainer').removeClass("d-none");
                        $("#callerno").val(phoneno);
                        $("#phoneInput").val(phoneno);
                        $("#callerno").trigger('change');
                        toggleRecording();
                        session.answer(callOptions);
                        session.connection.addEventListener('addstream', function (ea) {
                            var audio = document.getElementById('remoteAudio');
                            audio.srcObject = ea.stream;
                            audio.play();
                        });

                        session.on("ended", function () {
                            stopRecording();
                            $('#recordingIconContainer').addClass("d-none");
                            $("#makeCallBtn").addClass('d-block');
                            $("#makeCallBtn").removeClass('d-none');
                            $("#terminateCallBtn").addClass('d-none');
                            $("#terminateCallBtn").removeClass('d-block');
                            $("#holdCall").attr("disabled", "disabled");

                            var phn = $('#phoneInput').val();
                            if (phn.length > 1) {
                                $("#makeCallBtn").removeAttr('disabled');
                            } else {
                                $("#makeCallBtn").attr('disabled', 'disabled');
                            }

                            toggleTerminate('d');
                        });
                    }
                },
                declineCall: {
                    text: 'Reject',
                    btnClass: 'btn-red',
                    keys: ['esc'],
                    action: function () {
                        rtad.pause();
                        session.terminate(callOptions);
                    }
                }
            }
        });
    } else if (session.direction === "outgoing") {
        console.log('Making a call - see audio');
//                    console.log(ea);
        session.connection.addEventListener('addstream', function (ea) {
            var audio = document.getElementById('remoteAudio');
            audio.srcObject = ea.stream;
            audio.play();
        });
    }

    session.on('failed', function (e) {
        rtad.pause();
        toggleTerminate('d');
        calldailog.close();
        markCallAsMissedCall(phoneno);
    });
});


var eventHandlers = {
    'progress': function (e) {
        console.log('call is in progress');
    },
    'failed': function (e) {
        console.log(e);
        console.log('call failed with cause: ' + e.cause);
        toggleTerminate('d');
        toggleRecording('o');
        //                    stopRecording();
    },
    'ended': function (e) {
        console.log(e);
        console.log('call ended with cause: ' + e.cause);
        toggleTerminate('d');
        toggleRecording('o');
        //                    stopRecording();
    },
    'confirmed': function (e) {
        console.log(e);
        console.log('call confirmed');
        toggleRecording('o');
        //                    stopRecording();
    }
};
var options = {
    'eventHandlers': eventHandlers,
    'mediaConstraints': {
        'audio': true,
        'video': false
    }
};
function makeCallTo() {
    $("#makeCallBtn").removeClass('d-block');
    $("#makeCallBtn").addClass('d-none');
    $("#terminateCallBtn").removeClass('d-none');
    $("#terminateCallBtn").addClass('d-block');
    var notocall = $("#phoneInput").val();
    //                startRecording();

    ua.call('sip:' + notocall + '@' + ipaddr, options);
}


function terminateCall() {
    $("#makeCallBtn").addClass('d-block');
    $("#makeCallBtn").removeClass('d-none');
    $("#terminateCallBtn").addClass('d-none');
    $("#terminateCallBtn").removeClass('d-block');
    $("#holdCall").attr("disabled", "disabled");

    globalSession.terminate(options);
    toggleTerminate('d');
    //                toggleRecording('o');
    stopRecording();
}

function adddialednumber(inpt) {
    var tt = $("#phoneInput").val();
    $("#phoneInput").val(tt + inpt);
}

function removenumtodial() {
    var tt = $("#phoneInput").val();
    $("#phoneInput").val(tt.slice(0, -1));
}

function holdcall() {
    if (ishold) {
        //unhold
        globalSession.unhold();
        ishold = false;
        $("#holdIcon").removeClass("fa-solid fa-circle-play");
        $("#holdIcon").addClass("fa-solid fa-circle-pause");
        $("#holdBtnTxt").html("Hold Call");
    } else {
        //hold
        globalSession.hold();
        ishold = true;
        $("#holdIcon").removeClass("fa-solid fa-circle-pause");
        $("#holdIcon").addClass("fa-solid fa-circle-play");
        $("#holdBtnTxt").html("Unhold Call");
    }

}

window.AudioContext = window.AudioContext || window.webkitAudioContext;
var audioGlobalContext = new AudioContext();
var audioOutputAnalyser;
var inputPoint = null,
        audioRecorder = null;
var recIndex = 0;
var recording = false;
function gotBuffers(buffers) {
    audioRecorder.exportWAV(doneEncoding);
}
function doneEncoding(blob) {
    document.getElementById("remoteAudio").pause();
    Recorder.setupDownload(blob, "myRecording" + ((recIndex < 10) ? "0" : "") + recIndex + ".wav");
    recIndex++;
//            let fileInputElement = document.getElementById('audiofile');
    var fileInputElement = document.getElementById('audiofile');
//            let container = new DataTransfer();
    var container = new DataTransfer();
//            let data = new Blob([blob], { type:"audio/wav" });
    var data = new Blob([blob], {type: "audio/wav"});
//            let file = new File([data], new Date().getTime() + ".wav", {type:"audio/wav", lastModified:new Date().getTime()});
    var file = new File([data], new Date().getTime() + ".wav", {type: "audio/wav", lastModified: new Date().getTime()});
    container.items.add(file);
    fileInputElement.files = container.files;
    console.log(fileInputElement.files);
}
function toggleRecording(e) {
    //                if(e==='o'){
    if (recording === true) {
        $('#recordingIconContainer').addClass("d-none");
        recording = false;
        audioRecorder.stop();
        console.log("Recording Stopped");
        $("#makeCallBtn").addClass('d-block');
        $("#makeCallBtn").removeClass('d-none');
        $("#terminateCallBtn").addClass('d-none');
        $("#terminateCallBtn").removeClass('d-block');
        stopTimer();
        audioRecorder.getBuffers(gotBuffers);
        $("#holdCall").attr("disabled", "disabled");
//        $('#btnSave').removeAttr("disabled"); //operator save form button
        console.log("test");
        //
        //
        //                    }
    } else {
        if (!audioRecorder) {
            return;
        }
        recording = true;
        audioRecorder.clear();
        audioRecorder.record();
        resetTimer();
        startTimer();
        $('#recordingIconContainer').removeClass("d-none");
        console.log("Recording Started");
        $("#makeCallBtn").removeClass('d-block');
        $("#makeCallBtn").addClass('d-none');
        $("#terminateCallBtn").removeClass('d-none');
        $("#terminateCallBtn").addClass('d-block');
        $("#holdCall").removeAttr("disabled");
//        $('#btnSave').attr("disabled", "true"); //operator save form button
    }
}

function startRecording() {
    if (!audioRecorder) {
        return;
    }
    $('#recordingIconContainer').addClass("d-none");
    recording = true;
    audioRecorder.clear();
    audioRecorder.record();
    console.log("Recording Started");
    resetTimer();
    startTimer();
}

function stopRecording() {
    if (recording === true) {
        recording = false;
        audioRecorder.stop();
        $('#recordingIconContainer').removeClass("d-none");
        console.log("Recording Stopped");
        stopTimer();
        audioRecorder.getBuffers(gotBuffers);
    }
}


function gotAudioMicrophoneStream(stream) {
    var source = audioGlobalContext.createMediaStreamSource(stream);
    source.connect(inputPoint);
}
function gotAudioOutputStream() {
    var source = audioGlobalContext.createMediaElementSource(document.getElementById("remoteAudio"));
    source.connect(inputPoint);
    source.connect(audioGlobalContext.destination);
}
function initAudio() {
    if (!navigator.getUserMedia)
        navigator.getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
    //                    navigator.getUserMedia = navigator.webkitGetUserMedia || navigator.mediaDevices.getUserMedia || navigator.mozGetUserMedia;
    if (!navigator.cancelAnimationFrame)
        navigator.cancelAnimationFrame = navigator.webkitCancelAnimationFrame || navigator.mozCancelAnimationFrame;
    if (!navigator.requestAnimationFrame)
        navigator.requestAnimationFrame = navigator.webkitRequestAnimationFrame || navigator.mozRequestAnimationFrame;
    inputPoint = audioGlobalContext.createGain();
    navigator.getUserMedia({
        "audio": {
            "mandatory": {
                "googEchoCancellation": "true",
                "googAutoGainControl": "false",
                "googNoiseSuppression": "true",
                "googHighpassFilter": "false"
            },
            "optional": []
        }
    }, gotAudioMicrophoneStream, function (e) {
        alert('Error recording microphone. Either there is no microphone inputted or the microphone may be faulty.');
        console.log(e);
    });
    gotAudioOutputStream();
    var analyserNode = audioGlobalContext.createAnalyser();
    analyserNode.fftSize = 2048;
    inputPoint.connect(analyserNode);
    var zeroGain = audioGlobalContext.createGain();
    zeroGain.gain.value = 0.0;
    inputPoint.connect(zeroGain);
    zeroGain.connect(audioGlobalContext.destination);
    audioRecorder = new Recorder(inputPoint);
}
window.addEventListener('load', initAudio);



var j = 0;
var i = 1;
var s;
var m;

var timer;

function startTimer() {
    timer = setInterval(function () {
        var s;
        var m;
        if (i === 60) {
            i = 0;
            j++;
        }
        if (i <= 9) {
            s = "0" + i;
        } else {
            s = i;
        }
        if (j <= 9) {
            m = "0" + j;
        } else {
            m = j;
        }
        $("#softphone-timer").html(m + ":" + s);
        i++;
    }, 1000);
}

function stopTimer() {
    clearInterval(timer);
}

function resetTimer() {
    i = 0;
    j = 0;
    s = "00";
    m = "00";
}

function clearRecentPhone() {
    $('#phoneInput').val('');
    resetTimer();
}

//numberToTransfer
function transferCall() {
//    var a = $('#phoneInput').val();
    var b = $('#inputiPhoneno').val();
//    var ntt = numberToTransfer.trim();

    var eventHandlers = {
        requestSucceeded: function (e) {
            console.log("Transfer Succeed: ", e);
        },
        requestFailed: function (e) {
            console.log("Transfer Failed: ", e);
        },
        trying: function (e) {
            console.log("Trying: ", e);
        },
        progress: function (e) {
            console.log("Progress: ", e);
        },
        accepted: function (e) {
            console.log("Accepted", e);
        },
        failed: function (e) {
            console.log("Failed", e);
        }
    };
    try {
        // globalSession.refer(numberToTransfer, {eventHandlers, extraHeaders: [`Contact: <sip:${dest}@yourhost:yourport>`],});
        globalSession.refer('sip:' + b + '@' + ipaddr, options);
    } catch (err) {
        console.log(err);
    }
}


function checkIfOldCase(phoneno) {
    $.ajax({
        type: 'GET',
        url: './getcasecountbyphoneno.htm',
        data: 'phoneno=' + phoneno,
        success: function (data) {
            console.log('Phone No. Count:::::: ' + data);
            if (parseInt(data) === 0) {
                //disable
                $('#oldCaseBtn').attr('disabled', 'disabled');
            } else {
                //emable
                $('#oldCaseBtn').removeAttr('disabled');
            }
        },
        error: function (jqXHR, textStatus, errorThrown, data) {
            alert("error:" + textStatus + " - exception:" + errorThrown);
        }
    });
}




function markCallAsMissedCall(phoneno) {
    // console.log("Missed Call from: " + phoneno);
    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
    var csrfToken = $("meta[name='_csrf']").attr("content");

    var formData = new FormData();

//    formData.append('calldesc', 'Missed Call');
//    formData.append('call_status', 'Unsuccessful');
//    formData.append('callid', '5');
    formData.append('phoneno', phoneno);
//    formData.append('calltypeid', '1');

    $.ajax({
        type: 'POST',
        url: './markcallasmissedcall.htm',
        data: formData,
        processData: false,
        contentType: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        },
        success: function (data) {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown, data) {
            alert("error:" + textStatus + " - exception:" + errorThrown);
        }
    });

}



//function confCall() {
//    var b = $('#inputiPhoneno').val();
////    var ntt = numberToTransfer.trim();
//
//    var eventHandlers = {
//        requestSucceeded: function (e) {
//            console.log("Transfer Succeed: ", e);
//        },
//        requestFailed: function (e) {
//            console.log("Transfer Failed: ", e);
//        },
//        trying: function (e) {
//            console.log("Trying: ", e);
//        },
//        progress: function (e) {
//            console.log("Progress: ", e);
//        },
//        accepted: function (e) {
//            console.log("Accepted", e);
//        },
//        failed: function (e) {
//            console.log("Failed", e);
//        }
//    };
//    try {
//        var tones = '*0';
//
//        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
//
//        var options = {
//            'duration': 160,
//            'interToneGap': 1200,
//            'extraHeaders': extraHeaders
//        };
//        // globalSession.refer(numberToTransfer, {eventHandlers, extraHeaders: [`Contact: <sip:${dest}@yourhost:yourport>`],});
////        globalSession.refer('sip:' + b + '@' + ipaddr, options);
////        globalSession.replace('sip:' + b + '@' + ipaddr, options);
//        globalSession.sendDTMF(tones);
//    } catch (err) {
//        console.log(err);
//    }
//
//}



//function confAdd() {
////    var b = $('#inputiPhoneno').val();
////    var ntt = numberToTransfer.trim();
//
//    var eventHandlers = {
//        requestSucceeded: function (e) {
//            console.log("Transfer Succeed: ", e);
//        },
//        requestFailed: function (e) {
//            console.log("Transfer Failed: ", e);
//        },
//        trying: function (e) {
//            console.log("Trying: ", e);
//        },
//        progress: function (e) {
//            console.log("Progress: ", e);
//        },
//        accepted: function (e) {
//            console.log("Accepted", e);
//        },
//        failed: function (e) {
//            console.log("Failed", e);
//        }
//    };
//    try {
//        var tones = $('#inputiPhoneno').val();
//
//        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
//
//        var options = {
//            'duration': 160,
//            'interToneGap': 1200,
//            'extraHeaders': extraHeaders
//        };
//        // globalSession.refer(numberToTransfer, {eventHandlers, extraHeaders: [`Contact: <sip:${dest}@yourhost:yourport>`],});
////        globalSession.refer('sip:' + b + '@' + ipaddr, options);
////        globalSession.replace('sip:' + b + '@' + ipaddr, options);
//        globalSession.sendDTMF(tones);
//    } catch (err) {
//        console.log(err);
//    }
//
//}

//function confJoin() {
//    var b = $('#inputiPhoneno').val();
////    var ntt = numberToTransfer.trim();
//
//    var eventHandlers = {
//        requestSucceeded: function (e) {
//            console.log("Transfer Succeed: ", e);
//        },
//        requestFailed: function (e) {
//            console.log("Transfer Failed: ", e);
//        },
//        trying: function (e) {
//            console.log("Trying: ", e);
//        },
//        progress: function (e) {
//            console.log("Progress: ", e);
//        },
//        accepted: function (e) {
//            console.log("Accepted", e);
//        },
//        failed: function (e) {
//            console.log("Failed", e);
//        }
//    };
//    try {
//        var tones = '*#';
//
//        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
//
//        var options = {
//            'duration': 160,
//            'interToneGap': 1200,
//            'extraHeaders': extraHeaders
//        };
//        // globalSession.refer(numberToTransfer, {eventHandlers, extraHeaders: [`Contact: <sip:${dest}@yourhost:yourport>`],});
////        globalSession.refer('sip:' + b + '@' + ipaddr, options);
////        globalSession.replace('sip:' + b + '@' + ipaddr, options);
//        globalSession.sendDTMF(tones);
//        console.log('confJoin');
//    } catch (err) {
//        console.log(err);
//    }
//
//}


function confCall() {
    var b = $('#inputiPhoneno').val();
    if (b.length > 0) {
        // do the conference call
        $('#inputiPhoneno').removeClass('is-invalid');

        // 1. Add Current Call to Conference
        // 2. Call another number
        // 3. Add this person to the conference as well
        // 4. Then finally join the conference

        try {
            var tones = '*2' + b.trim() + '*3';
            var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
            var options = {
//                'duration': 160,
//                'interToneGap': 1200,
//                'extraHeaders': extraHeaders
            };

//            for(i=0;i<tones.length;i++) {
            globalSession.sendDTMF(tones, options);
//                globalSession.sendDTMF(tones, options);
//            }
            console.log(tones);
        } catch (err) {
            console.log(err);
            res = 0;
        }

//    try {
//        var tones = '7001';
//        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
//        var options = {
//        };
//        globalSession.sendDTMF(tones, options);
//    } catch (err) {
//        console.log(err);
//        res = 0;
//    }

//    try {
//        var tones = '*3';
//        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
//        var options = {
//        };
//        globalSession.sendDTMF(tones, options);
//    } catch (err) {
//        console.log(err);
//        res = 0;
//    }


//        console.log('Adding this person to the conference');
//        var check = addToConf();
//
//        if (check === 1) {
//            $('#confBtn').attr('disabled', 'disabled');
//            // wait for 3 seconds
////            var s = 1;
////            setTimeout(function () {
////                console.log('Sec: ' + s++);
////            }, 2000);
//            check = callNo(b);
//            if (check === 1) {
////                $('#bridgeCallBtn').removeAttr('disabled');
//                joinConf()
//            }
//            console.log('Dialled the number');
//        }


    } else {
        $('#inputiPhoneno').focus();
        $('#inputiPhoneno').addClass('is-invalid');
        return;
    }
}


//function confMonkey() {
//    var eventHandlers = {
//        requestSucceeded: function (e) {
//            console.log("Transfer Succeed: ", e);
//        },
//        requestFailed: function (e) {
//            console.log("Transfer Failed: ", e);
//        },
//        trying: function (e) {
//            console.log("Trying: ", e);
//        },
//        progress: function (e) {
//            console.log("Progress: ", e);
//        },
//        accepted: function (e) {
//            console.log("Accepted", e);
//        },
//        failed: function (e) {
//            console.log("Failed", e);
//        }
//    };
//    try {
//        var tones = '#9';
//        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
//        var options = {
//        };
//        globalSession.sendDTMF(tones, options);
//        console.log('confMonkeys');
//    } catch (err) {
//        console.log(err);
//    }
//
//}


//function confCall() {
//    conference(globalSession, 'remoteAudio');
//}



//function to create conference by mixing audio
//sessions => array with JsSIP.RTCSessions calls
//remoteAudioId => the ID of your <audio> element to play the received streams
//function conference(sessions, remoteAudioId) {
//	//take all received tracks from the sessions you want to merge
//	var receivedTracks = [];
//	sessions.forEach(function(session) {
//		if(session !== null && session !== undefined) {
//    		session.connection.getReceivers().forEach(function(receiver) {			
//    			receivedTracks.push(receiver.track);
//    		});
//		}
//	});
//
//	//use the Web Audio API to mix the received tracks
//	var context = new AudioContext();	
//	var allReceivedMediaStreams = new MediaStream();
//	
//	sessions.forEach(function(session) {	
//		if(session !== null && session !== undefined) {
//
//    		var mixedOutput = context.createMediaStreamDestination();
//    		
//    		session.connection.getReceivers().forEach(function(receiver) {
//    			receivedTracks.forEach(function(track) {
//    				allReceivedMediaStreams.addTrack(receiver.track);
//    				if(receiver.track.id !== track.id) {
//        				var sourceStream = context.createMediaStreamSource(new MediaStream([track]));
//    					sourceStream.connect(mixedOutput);
//    				}
//    			});
//    		});
//		//mixing your voice with all the received audio
//    		session.connection.getSenders().forEach(function(sender) {
//    			var sourceStream = context.createMediaStreamSource(new MediaStream([sender.track]));
//    			sourceStream.connect(mixedOutput);
//    		});
//    		session.connection.getSenders()[0].replaceTrack(mixedOutput.stream.getTracks()[0]);
//		}
//	});
//
//	//play all received stream to you
//	var remoteAudio = document.getElementById('remoteAudio');    
//	remoteAudio.srcObject = allReceivedMediaStreams;
//	var promiseRemote = remoteAudio.play();
////	if(promiseRemote !== undefined) {
////		promiseRemote.then(_ => {
////			console.log("playing all received streams to you");
////		}).catch(error => {
////			console.log(error);
////		});
////	}
//}


//function initiateOutgoingCall() {
//    var notocall = $("#inputiPhoneno").val();
//  var options = {
//    'eventHandlers': {
//      'succeeded': function() {
//        console.log('Call answered');
//      },
//      'failed': function() {
//        console.log('Call failed');
//      }
//    }
//  };
////  ua.call('sip:7001@'++, options);
//ua.call('sip:' + notocall + '@' + ipaddr, options);
//}


function addToConf() {
    var res = 0;
    try {
        var tones = '*2';
        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
        var options = {
        };
        globalSession.sendDTMF(tones, options);
        res = 1;
    } catch (err) {
        console.log(err);
        res = 0;
    }
}



function callNo(tones) {
    console.log("Calling No: " + tones);
    var res = 0;
    try {
//        var tones = '*0';
        tones = tones.trim();
        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
        var options = {
        };
        console.log(tones);
        globalSession.sendDTMF(tones, options);
        res = 1;
    } catch (err) {
        console.log(err);
        res = 0;
    }
}

function joinConf() {
    console.log("Joining Conference");
    var res = 0;
    try {
//        var tones = '*0';
        tones = '*3';
        var extraHeaders = ['X-Foo: foo', 'X-Bar: bar'];
        var options = {
        };
        console.log(tones);
        globalSession.sendDTMF(tones, options);
        res = 1;
    } catch (err) {
        console.log(err);
        res = 0;
    }
}