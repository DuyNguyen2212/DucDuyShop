package ducduyshop.service;

import org.springframework.stereotype.Service;

import ducduyshop.dto.PaginationDto;

@Service
public interface IPaginationService {
	public PaginationDto getInfoPagination(int totalData, int limit, int current);
}
