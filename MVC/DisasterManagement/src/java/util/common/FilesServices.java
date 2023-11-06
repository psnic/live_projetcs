/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util.common;

import it.sauronsoftware.jave.AudioAttributes;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.EncodingAttributes;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import org.apache.commons.io.IOUtils;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

/**
 *
 * @author joseph
 */
/*
    This Class deals with File coversion.

    1. Convert from Multipart to File.
    2. Convert from WAV to MP3

    *** More features to be added as required ***

 */
public class FilesServices {

    public FilesServices() {
    }

    // As the name implies, takes  in Multipart and converts to File
    public File convertMultipartToFile(MultipartFile file) throws IOException {
//        File convFile = new File(file.getOriginalFilename());
//        FileOutputStream fos = new FileOutputStream(convFile);
//        fos.write(file.getBytes());
//        fos.close();
//        return convFile;

        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;

// File cfile = new File(file.getOriginalFilename());
//        try (InputStream inputStream = file.getInputStream()) {
//            Files.copy(inputStream, file.toPath());
//        }
//        return cfile;
    }

    // Take WAV file and generates a 128 kbit/s, stereo, 44100 Hz MP3 file and return it as Multipart
    public MultipartFile convertWavToMp3(File convFile) throws EncoderException, FileNotFoundException, IOException {
        File source = convFile;
        File target = new File("target.mp3");
        AudioAttributes audio = new AudioAttributes();
        audio.setCodec("libmp3lame");
        audio.setBitRate(new Integer(128000));
        audio.setChannels(new Integer(2));
        audio.setSamplingRate(new Integer(44100));
        EncodingAttributes attrs = new EncodingAttributes();
        attrs.setFormat("mp3");
        attrs.setAudioAttributes(audio);
        Encoder encoder = new Encoder();
        encoder.encode(source, target, attrs);

        FileInputStream fis = new FileInputStream(target);
        MultipartFile multipartFile = new MockMultipartFile("file", target.getName(), "audio/mpeg", IOUtils.toByteArray(fis));

        return multipartFile;

    }

}
