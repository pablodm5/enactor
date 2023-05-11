# Workspace Setup

Please follow steps outlined at:
https://enactor.atlassian.net/wiki/spaces/~531283187/pages/2751169280/Workspace+Setup+Hopefully+the+last+one

### Test Data

##### Basic product
	
	--- JVC LT-40CA890 Android TV 40 : 500100

### Applications

###### Estate Manager

        Ports:  39830 - Estate Manager Maintenance
				39832 - Estate Manager Processing
                39833 - Estate Manager Services
        Device: estateManager.enactor
        JDBC:   jdbc:mysql://localhost:3306/enactorem
                username:root
                password:enactor
        User:   admin
        Pass:   admin

###### Retail Pos (Swing Thick)

        Device: pos1@0001.enactor
        JDBC:   jdbc:mysql://localhost:3306/enactorem
                username:root
                password:enactor
        User:1
        Pass:1"# enactor" 
