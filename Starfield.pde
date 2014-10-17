Particle[] dots;
int[] colorOne, colorTwo, colorThree;
void setup()
{
	size(500,500);
	dots = new Particle[1000];
	colorOne = new int[1000];
	colorTwo = new int[1000];
	colorThree = new int[1000];
	for(int i = 0; i < dots.length-1; i++)
	{
		dots[i] = new NormalParticle();
		colorOne[i] = (int)(Math.random()*256);
		colorTwo[i] = (int)(Math.random()*256);
		colorThree[i] = (int)(Math.random()*256);
	}
	dots[999] = new OddballParticle();
}
void draw()
{
	background(0);
	for(int i = 0; i < dots.length-1; i++)
	{
		fill(colorOne[i],colorTwo[i],colorThree[i]);
		dots[i].move();
		dots[i].show();
	}
	dots[999].show();
	dots[999].move();
}
class NormalParticle implements Particle
{
	double nX, nY, nAngle, nSpeed;
	NormalParticle()
	{
		nX = 250;
		nY = 250;
		nAngle = Math.random()*2*Math.PI;
		nSpeed = Math.random()*2;
	}
	public void move()
	{
		nX = nX + Math.cos(nAngle)*nSpeed;
		nY = nY + Math.sin(nAngle)*nSpeed;
		if(nX < 0 || nX > 500)
		{
			nX = 250;
			nY = 250;
			nAngle = Math.random()*2*Math.PI;
			nSpeed = (Math.random()*1)/2+.2;
		}
		if(nY < 0 || nY > 500)
		{
			nY = 250;
			nX = 250;
			nAngle = Math.random()*2*Math.PI;
			nSpeed = (Math.random()*1)/2+.2;
		}
	}
	public void show()
	{
		ellipse((float)nX,(float)nY,5,5);
	}
}
interface Particle
{
	public void move(); 
	public void show();
}
class OddballParticle implements Particle
{
	double oX, oY, oAngle, oSpeed;
	OddballParticle()
	{
		oX = 250;
		oY = 250;
		oAngle = Math.random()*2*Math.PI;
		oSpeed = Math.random()*3+1;
	}
	public void move()
	{
		oX = oX + Math.cos(oAngle)*oSpeed;
		oY = oY + Math.sin(oAngle)*oSpeed;
		if(oX < 0 || oX > 500)
		{
			oX = 250;
			oY = 250;
			oAngle = Math.random()*2*Math.PI;
			oSpeed = Math.random()*3+1;
		}
		if(oY < 0 || oY > 500)
		{
			oX = 250;
			oY = 250;
			oAngle = Math.random()*2*Math.PI;
			oSpeed = Math.random()*3+1;
		}
	}
	public void show()
	{
		fill(255,0,0);
		ellipse((float)oX,(float)oY,15,15);
	}
}
