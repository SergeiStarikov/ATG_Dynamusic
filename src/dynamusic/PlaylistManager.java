package dynamusic;

import atg.nucleus.*;
import java.util.*;
import atg.repository.*;
import atg.repository.servlet .*;
import javax.transaction.*;
import atg.dtm.*;

public class PlaylistManager extends GenericService {

    private Repository mUserRepository = null;
    private TransactionManager mTransactionManager = null;
    private Repository mSongsRepository = null;
    
    //---------------------------------------------------------//
    // Property getters and setters                            //
    //---------------------------------------------------------//
        
    public void setUserRepository(Repository pRepository) {
        mUserRepository = pRepository;
    }
    
    public Repository getUserRepository() {
        return mUserRepository;
    }
    
    public void setSongsRepository(Repository pRepository) {
        mSongsRepository = pRepository;
    }
    
    public Repository getSongsRepository() {
        return mSongsRepository;
    }
    
    public TransactionManager getTransactionManager() {
        return mTransactionManager;
    }
    
    public void setTransactionManager(TransactionManager pTransactionManager) {
        mTransactionManager = pTransactionManager;
    }        


    //----------------------------------------------------------------
    // Utility methods
    //----------------------------------------------------------------
    
    
    
    public void addPlaylistToUser(String pPlaylistId, String pUserId) throws  RepositoryException {
    
    /* TBD: transactions here */
    
            if (isLoggingDebug())
  		logDebug("adding playlist " + pPlaylistId + " to user " + pUserId);  	

  	    MutableRepository repository = (MutableRepository) getUserRepository();
  	    RepositoryItem playlist = repository.getItem(pPlaylistId, "playlist");
  	    MutableRepositoryItem user = repository.getItemForUpdate(pUserId,"user");
  	    
  	    Collection playlist_set = (Collection)user.getPropertyValue("playlists");
  	    try {  	    
  	         playlist_set.add(playlist);
  	    }
  	    catch (Exception e) {
  	       if (isLoggingError())
  	           logError(e);
  	       throw new RepositoryException("Unable to add playlist to user", e);
  	    }
  	    user.setPropertyValue("playlists", playlist_set);
  	    repository.updateItem(user);
  	
    }

    public void addSongToPlaylist(String pPlaylistId, String pSongId) throws  RepositoryException 
    {
  	    MutableRepository userRep = (MutableRepository) getUserRepository();
  	    Repository songsRep = getSongsRepository();
  	    
            MutableRepositoryItem playlist = userRep.getItemForUpdate(pPlaylistId, "playlist");
            RepositoryItem song = songsRep.getItem(pSongId, "song");
            
            // TBD: error checking on valid ids
            
            Collection songlist = (Collection)playlist.getPropertyValue("songs");
            try {
                 songlist.add(song);
            }
            catch (Exception e) {
                if (isLoggingError())
                    logError("Cannot add song to playlist", e);
            }
            userRep.updateItem(playlist);
            
    }
}
