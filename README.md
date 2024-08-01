# PickAWinner

**PickAWinner** is a SwiftUI application designed to randomly select one or more winners from a list of entrants. The app includes features for managing the list of entrants, viewing the chance of winning, and customizing settings.

## Features

- **Add Entrants**: Enter names to add them to the list of potential winners.
- **Pick Winners**: Randomly select one or more winners from the list.
- **Delete Entrants**: Remove specific entrants or clear the entire list.
- **Show Win Chance**: Display the chance of winning for each entrant.
- **Settings**: Customize the number of winners to be picked and whether to show the winning chance.
- **TipKit Integration**: Provides helpful tips for users.
  
## Usage

### Adding Entrants

1. **Enter Names**: 
   - In the main screen, you will see a text field labeled "Enter entrant."
   - Type the name of the entrant you want to add.
   - Press Return or tap the "Add" button to add the name to the list of entrants.

2. **View Entrants**:
   - All added entrants will be displayed in a scrollable list below the text field.
   - Each entrant's name will appear in the list.

### Picking Winners

1. **Select Number of Winners**:
   - Tap the gear icon in the top-right corner to open the settings.
   - Use the "Winner Count" picker to select the number of winners you want to choose.

2. **Pick Winners**:
   - Tap the "Pick Winners" button on the main screen.
   - The selected number of winners will be displayed, and their names will be highlighted in green.
   - The app will provide confetti animation and a success haptic feedback for the action.

### Deleting Entrants

1. **Delete Individual Entrants**:
   - Swipe left on any entrant's name in the list.
   - Tap the trash icon that appears to delete that specific entrant.

2. **Delete All Entrants**:
   - Tap the "Delete All" button located at the bottom of the list.
   - This action will remove all entrants from the list and clear the winners.

### Settings

1. **Show Win Chance**:
   - In the settings page, toggle the switch for "Show Win Chance."
   - When enabled, the app will display the chance of winning for each entrant next to their name.

2. **Set Number of Winners**:
   - Adjust the number of winners using the "Winner Count" picker in the settings.
   - The app will pick the specified number of winners each time the "Pick Winners" button is pressed.

### Tips

- **TipKit Integration**: 
  - When accessing the settings, TipKit provides a helpful tip indicating where to find the settings icon and what adjustments can be made.
  - You can dismiss these tips by interacting with the settings page.
 
## Technologies Used

### SwiftUI

- **SwiftUI**: Apple’s modern framework for building user interfaces. It uses a declarative syntax to create dynamic and responsive UIs with ease.

### ConfettiSwiftUI

- **ConfettiSwiftUI**: A SwiftUI library that adds fun confetti animations to celebrate the selection of winners. It enhances the user experience by visually highlighting important actions.

### SPIndicator

- **SPIndicator**: A SwiftUI component used to display important notifications, such as errors and successes, to the user. It helps in providing feedback and alerting users about various events.

### TipKit

- **TipKit**: A library for providing contextual tips and guidance to users. It helps users understand how to use different features within the app, such as accessing the settings page.

##Contact

**For any questions or feedback, please contact emreilhn15@gmail.com.
