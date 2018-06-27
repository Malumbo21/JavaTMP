package com.javatmp.domain;

import java.io.Serializable;

public class Theme implements Serializable {

    private static final long serialVersionUID = 1L;
    private String themeId;
    private String themeName;

    public Theme() {
    }

    public Theme(String themeId, String themeName) {
        this.themeId = themeId;
        this.themeName = themeName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (this.getThemeId() != null ? this.getThemeId().hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Theme)) {
            return false;
        }
        Theme other = (Theme) object;
        if ((this.getThemeId() == null && other.getThemeId() != null) || (this.getThemeId() != null && !this.themeId.equals(other.themeId))) {
            return false;
        }
        return true;
    }

    /**
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    /**
     * @return the themeName
     */
    public String getThemeName() {
        return themeName;
    }

    /**
     * @param themeName the themeName to set
     */
    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

}