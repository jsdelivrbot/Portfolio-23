Scenario: 

Your company's users create or edit a collection of text files
throughout the day. These text files represent data about customer
orders.
Once per day, any files that are new, or that were edited within the
previous 24 hours, must be sent to the home office. To facilitate this,
these new or updated files need to be copied to a specific 'destination'
folder on a computer, so that a special file transfer program can grab
them and transfer them to the home office.
The process of figuring out which files are new or recently edited, and
copying them to the 'destination' folder, is currently being done
manually. This is very expensive in terms of manpower.
You have been asked to create a script that will automate this task,
saving the company a lot of money over the long term.

Impediments:

After solving a simple problem figuring out why my variable filesInfo wouldn't exist due to the fact it was created in a for loop and
wouldn't be available to any other code outside of it, I finally created a script that had no errors. The problem was though that none
of the files were transfering. Since I didn't have any reference as to what was going wrong I was left to my own self to find the solution. 

1.) I first realized that the way I was getting the modification time was incorrect. I was using:

foreach (string s in files)
            {
                string fileName = Path.GetFileName(s);
                FileInfo filesInfo = new FileInfo(fileName);
          
where files was a variable that represented: public static string[] files = System.IO.Directory.GetFiles(src, "*.txt");

I assumed that by passing in fileName through filesInfo I would get the information of every file, including the time. This was not 
specific enough I realized though.

So I used Datetime's File.GetLastWriteTime and passed in s instead of fileName as you can see in my finished code. Finally, I was getting 
a specific time.

2.) Secondly I realized the way I was comparing the files last write time was wrong:

if (filesInfo.LastWriteTime.Date == DateTime.Today.Date)

Here all I am doing is comparing the last write time to todays date, which doesn't give an exact 24 hour count down. Also the 
equality operator I was using was finding an exact match to the time, not giving the option to find a time frame.
After figuring out I created this new statement:

if (filesInfo >= DateTime.Now.AddDays(-1))

Now I was using the AddDays module to subract 24 hours and used a less than or equal to operator to find all files modified/created
in that time frame.

3.) Lastly I found out that the way I was moving the files was incorrect:

File.Move(src, dst);

Currently, my File.Move(src, dst) is pointing to two directories but the move function is meant to move files not folders/directories.
In order to solve this all I had to do was pass in a specific file variable which is when I chose to use s and fileName:

File.Move(s, dst + fileName);

Finally I had a working script. Another great day at coding and learning something new.

