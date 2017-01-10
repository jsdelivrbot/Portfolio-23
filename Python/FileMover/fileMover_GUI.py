import time
import datetime
import os
import shutil
from tkinter import * # This already includes filedialog
from tkinter import ttk
import sqlite3


class MainClass():
    def __init__(self, root):

        self.master = root # Assign the root level to the Tkinter frame object

        self.master.minsize(640,200) # w x h
        self.master.maxsize(640,200) # if we state both then the the user cannot change size of the window
        self.master.title("Check files")

        self.var_src = StringVar() # Create these StringVars so we can pass it around and display it
        self.var_dst = StringVar() # Create these StringVars so we can pass it around and display it
        self.var_lstchckd = StringVar()

        self.lbl_src = Label(self.master, textvariable=self.var_src) # Assign the StringVar so it will recognize changes
        self.lbl_src.grid(row=0,column=0, padx=(2,2), pady=(5,5)) # Always pack on seperate line as Tkinter will get buggy otherwise
        self.var_src.set("Choose your source folder") # Assign initial message stored in our StringVar

        self.button_src = Button(self.master, text='Source',width=12, height=2, command=lambda: self.getSrc()) #call our function
        self.button_src.grid(row=1,column=0, padx=(0,0), pady=(0,10))

        self.lbl_dst = Label(root, textvariable=self.var_dst) # Assign the StringVar so it will recognize changes
        self.lbl_dst.grid(row=0,column=3, padx=(2,2), pady=(5,5)) # Always pack on seperate line as Tkinter will get buggy otherwise
        self.var_dst.set("Chose your destination folder") # Assign initial message stored in our StringVar

        self.button_dst = Button(self.master, text='Destination',width=12, height=2, command=lambda: self.getDst()) #call our function
        self.button_dst.grid(row=1,column=3, padx=(0,0), pady=(0,10))

        self.btn_Check = Button(self.master, text='Check Files',width=12, height=2, command=lambda: self.fileCheck()) #call our function
        self.btn_Check.grid(row=2,column=0, padx=(0,0), pady=(0,0))

        self.btn_Close = Button(self.master, text='Close',width=12, height=2, command=lambda: self.onClose()) #call our function
        self.btn_Close.grid(row=2,column=3, padx=(0,0), pady=(0,0))

        self.lbl_lstchckd = Label(root, textvariable=self.var_lstchckd)
        self.lbl_lstchckd.grid(row=4, column=1)

        self.create_table()

        self.del_update_time()

        
        
        

    def getSrc(self): # Get the user's path and assign it in the Labal and in StringVar
        srcPath = filedialog.askdirectory(parent=self.master,initialdir="C:/",title='Please select a directory...')
        self.var_src.set(srcPath) # assign the StringVar the user's selected path

    def getDst(self): # Get the user's path and assign it in the Labal and in StringVar
        dstPath = filedialog.askdirectory(parent=self.master,initialdir="C:/",title='Please select a directory...')
        self.var_dst.set(dstPath) # assign the StringVar the user's selected path

    def onClose(self):
        self.master.destroy() # This will kill the master Tk() window and ultimately all children
        os._exit(0)# This closes app and kills all processes and prevents memory leaks

    def fileCheck(self):
        srcPath = self.var_src.get() #Retrieve user's indicated directory path from StringVar
        dstPath = self.var_dst.get() #Retrieve user's indicated directory path from StringVar
        for fname in os.listdir(srcPath): # Iterate through the user's indicated source dir
            if fname.endswith('.txt'): # Apply our filter for .txt files
                src_fname = os.path.join(srcPath,fname) # Create absolute paths to the filename
                dst_fname = os.path.join(dstPath,fname) # Create absolute paths to the filename
                mtime = (os.path.getmtime(src_fname)) # file creation/modification date
                timeDiff = time.time() - mtime #Difference from time of file creation or modification until current time
                _24hrsAgo = time.time() - (24 *60 *60) #Epoc time for a 24hr period is 86400 seconds
                last24hrs = time.time() - _24hrsAgo #Seconds that have occured within the last 24 hr period
                if timeDiff < last24hrs: #Seconds that have passed since file creation or modification from last 24 hrs
                    shutil.move(src_fname,dst_fname)
                    print(src_fname,dst_fname)
        messagebox.showinfo("Check Complete","Process completed, there are no more qualifying files at this time.") # inform user that check is completed
        self.del_update_time()

    def connectdb(self):
        conn = sqlite3.connect('last_modified.db')
        c = conn.cursor()
        return conn,c

    def closedb(self,conn,c):
        c.commit()
        c.close()

    def datereturn(self):
        unix = time.time()
        date = str(datetime.datetime.fromtimestamp(unix).strftime('%Y-%m-%d %H:%M:%S'))
        return unix,date

    def create_table(self):
        conn,c = self.connectdb()
        c.execute("""CREATE TABLE IF NOT EXISTS check_last_modified(unix REAL, datestamp TEXT);""");
        self.closedb(c,conn)

    def data_entry():
        conn,c = self.connectdb()
        c.execute("INSERT INTO check_last_modified VALUES(1451255552, '2016-01-02')")
        self.closedb(c,conn)

    def dynamic_data_entry():
        conn,c = self.connectdb()
        unix,date = self.datereturn()
        c.execute("""INSERT INTO check_last_modified (unix, datestamp) VALUES (?, ?)""",
                  (unix, date))
        self.closedb(c,conn)

    def del_update_time(self):
        unix,date = self.datereturn()
        conn,c = self.connectdb()
        print(unix,date)
        c.execute("""UPDATE check_last_modified SET unix = (?), datestamp = (?)""",(unix, date))
        self.var_lstchckd.set("Last modified: " + date )
        self.closedb(c,conn)





if __name__=='__main__':
    root = Tk()
    App = MainClass(root)
    root.mainloop()
