package com.sofCap.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FilesDto {
	int id;

	String file_name;
	int size;
	byte[] data;
}
