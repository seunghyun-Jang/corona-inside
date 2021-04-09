package kr.ac.hansung.cse.dto.Covid19Inf;

import java.util.Arrays;
import java.util.List;


public class ItemsDTO {
	
	
	private ItemDTO[] item;
	
	public ItemsDTO() {
		super();
	}

	public ItemsDTO(ItemsDTO dto) {
		super();
		this.item = dto.item;
	}

	public ItemDTO[] getItem() {
		return item;
	}

	public void setItem(ItemDTO[] item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "ItemsDTO [item=" + Arrays.toString(item) + "]";
	}

	
	
	
	
}
