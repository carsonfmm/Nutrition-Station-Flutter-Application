using Microsoft.AspNetCore.Mvc;
using Database.Entities;
using Database;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class FoodController : ControllerBase
{
    private readonly ILogger<FoodController> _logger;
    private readonly QueryTool _queryTool;

    public FoodController(ILogger<FoodController> logger, QueryTool queryTool)
    {
        _logger = logger;
        _queryTool = queryTool;
    }

    [HttpGet("{id}")]
    public Food Get([FromRoute] int id)
    {
        return _queryTool.FoodById(id: id);
    }

    [HttpGet("search")]
    public IEnumerable<Food> Search([FromQuery(Name = "q")] string query) {
        return _queryTool.SearchForFood(searchTerm: query);
    }
}
