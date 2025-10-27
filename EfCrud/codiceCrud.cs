






public async Task<ActionResult<IEnumerable<PalyerDto> GetPlayers()
{
  var players = _context.Players.AsNoTracking ().Select (p => new PlayerDto
                                                         {

                                                         });
  return await players.ToListAsinc();
}




























































