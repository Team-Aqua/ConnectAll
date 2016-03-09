# Meeting Notes

Controller modify Model 
Model updates view (or View updates on model changes)


Top 1 and 2 => P1, P2

Drop animations

Sound effects

Background music


On View Click. Controller registers column number. Communicates this to model. Which uses its redblack column model to determine where the placed tile goes and updates its neighbor grid model.

Tile places by controller informing Model. Model runs its grid data through Game Logic. Game logic returns state/info potentially giving Game State Model and update on its win status. This update would notify controller that win status should be activated. Controller tells view to post Alert.


so if one column is full. Model to report to the controller (red button controller for that column ) which tells the view to grayed out red block

FOr Menu
each Menu Page (View) has a Menu Controller 

Click Toggle Player color


Deadlines:

Friday: Re-factored into MVC
